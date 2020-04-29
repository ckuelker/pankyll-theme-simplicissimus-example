# +---------------------------------------------------------------------------+
# | Makefile                                                                  |
# |                                                                           |
# | Pankyll-Theme-Simplicissimus-Example                                      |
# |                                                                           |
# | Version: 0.1.2 (change inline)                                            |
# |                                                                           |
# | Changes:                                                                  |
# |                                                                           |
# | 0.1.2 2020-04-29 Christian Külker <c@c8i.org>                             |
# |     - add more phony targets                                              |
# |     - read configuration partly from cfg.yaml                             |
# |     - build example root index.html                                       |
# |     - server target supports URL prefix                                   |
# |                                                                           |
# | 0.1.1 2020-04-21 Christian Külker <c@c8i.org>                             |
# |     - add descriptive message for server target                           |
# |                                                                           |
# | 0.1.0 2020-04-21 Christian Külker <c@c8i.org>                             |
# |     - initial release                                                     |
# |                                                                           |
# +---------------------------------------------------------------------------+
#
# Makefile version
VERSION=0.1.0
PORT=8004
NS=pankyll-theme-simplicissimus-example
# -----------------------------------------------------------------------------
# NO CHANGES BEYOND THIS POINT
ifndef VERSION
$(error VERSION is NOT defined)
endif
THEME:=simplicissimus
HOST=$(shell hostname)
DSTD=$(shell python3 -c "import yaml;print(yaml.load(open('cfg.yaml'))['site']['public_dir'])")
PFX=$(shell python3 -c "import yaml;print(yaml.load(open('cfg.yaml'))['site']['url'])")
LOC=$(shell python3 -c "import yaml;print(yaml.load(open('cfg.yaml'))['default']['l10n_locale'])")
PFXDIR=$(shell echo "$(PFX)"|sed -e 's%^/%%')
NPROC=$(shell nproc)
WDIR=$(shell echo $(DSTD) $(PFXDIR)|tr ' ' '/') # public | public/PFXDIR
DEBUG_PRINT='1[$@]2[$%]3[$<]4[$?]5[$^]6[$+]7[$|]8[$*]9[$(@D)]10[$(@F)]11[$(*D)]\n12[$(*F)]13[$(%D)]14[$(%F)]15[$(<D)]16[$(<F)]17[$(^D)]18[$(^F)]\n19[$(+D)]20[$(+F)]21[$(?D)]22[$(?F)]\n'
LINKCHECK_SERVER:=http://localhost:$(PORT)
LINKCHECK_PARAMS:=--no-status -o blacklist $(LINKCHECK_SERVER)
L:=============================================================================
.PHONY: build clean htmlclean info markdownclean pdfclean realclean server \
	submodule-update test usage submoduleclean submodule-pull \
	repository-update

usage:
	@echo "$(L)"
	@echo "USAGE:"
	@echo "$(L)"
	@echo "make usage            : this information"
	@echo "make info             : print more info"
	@echo "make clean            : remove porcess files"
	@echo "make markdownclean    : remove all *.md from target (debug)"
	@echo "make htmlclean        : remove all *.html from target (debug)"
	@echo "make pdfclean         : remove all *.pdf from target (debug)"
	@echo "make submoduleclean   : remove all changes from content, pandoc"
	@echo "                        and themes/pankyll-theme-$(THEME)"
	@echo "make realclean        : remove target"
	@echo "make submodule-update : update git sub-modules configuration"
	@echo "make submodule-pull   : get latest git sub-module update"
	@echo "make repository-update: update git repository"
	@echo "make build            : build project"
	@echo "make server           : start a development server on port $(PORT)"
info:
	@echo "NS     : [$(NS)]"
	@echo "VERSION: [$(VERSION)]"
	@echo "LOC    : [$(LOC)]"
	@echo "DSTD   : [$(DSTD)]"
	@echo "PFX    : [$(PFX)]"
	@echo "PFXDIR : [$(PFXDIR)]"
	@echo "WDIR   : [$(WDIR)]"
	@echo "NPROC  : [$(NPROC)]"
	@echo "HOST   : [$(HOST)]"
	git submodule status --recursive
# for development (might remove too much or too less files for a clean build)
markdownclean:
	find $(DSTD) -name "*.md"|xargs -d '\n' rm -f
# for development (might remove too much or too less files for a clean build)
htmlclean:
	find $(DSTD) -name "*.html"|xargs -d '\n' rm -f
# for development (might remove too much or too less files for a clean build)
pdfclean:
	find $(DSTD) -name "*.pdf"|xargs -d '\n' rm -f
# for development (might remove too much or too less files for a clean build)
publicclean:
	rm -rf $(DSTD)
# clean process files
clean:
	rm -f pankyll.log pankyll.err pankyll.out
# the make the submodule clean: WARNING changes will be lost
submoduleclean:
	cd pandoc && git checkout master
	cd content && git checkout master
	cd themes/pankyll-theme-$(THEME) && git checkout master
# clean build target
realclean: clean publicclean
test:
	@echo "$(DEBUG_PRINT)"
static:
	mkdir -p $@
$(DSTD):
	mkdir -p $@
# make sure pankyll is in your PATH
build: static $(DSTD)
	@echo "running pankyll - this can take a while (logfile: pankyll.log)"
	@echo $(L)
	pankyll 2>pankyll.err|tee -a pankyll.out
	@echo $(L)
	@echo "running pankyll - finished"
	@echo $(L)
	@cat pankyll.err
	sed -i -e 's%=/en_US/index.html%=$(PFX)/$(LOC)/index.html%' $(DSTD)/index.html
	sed -i -e 's%=//en_US/index.html%=/$(LOC)/index.html%' $(DSTD)/index.html
repository-update:
	git pull
submodule-update:
	git submodule update --remote
	git submodule update --init --recursive --jobs $(NPROC)
	cd themes/pankyll-theme-$(THEME) && git submodule update --remote
	cd themes/pankyll-theme-$(THEME) && git submodule update --init --recursive --jobs $(NPROC)
submodule-pull:
	cd pandoc && git pull
	cd content && git pull
	cd themes/pankyll-theme-$(THEME) && git pull
server:
	@if [ "$(PFX)" = "/" ]; then \
	    echo "$(L)\nhttp://localhost:$(PORT)\nhttp://${HOST}:$(PORT)\n$(L)"; \
	else \
	    echo "$(L)\nhttp://localhost:$(PORT)/$(PFXDIR)\nhttp://${HOST}:$(PORT)/$(PFXDIR)\n$(L)"; \
	fi
	@if [ "$(PFX)" = "/" ]; then \
	    cd $(DSTD) && python3 -m http.server $(PORT);\
	else \
	    if [ -d /tmp/$(NS) ]; then rm -rf /tmp/$(NS) ]; fi; \
	    mkdir -p /tmp/$(NS)/$(WDIR);\
	    cp -a public/* /tmp/$(NS)/$(WDIR);\
	    cd /tmp/$(NS)/$(DSTD) && python3 -m http.server $(PORT);\
	fi
linkcheck-local:
	@echo "Check local links via $(LINKCHECK_SERVER), will report broken links"
	linkchecker $(LINKCHECK_PARAMS)
	@echo "Links PASS"
linkcheck-local-extern:
	@echo "Check local and remote links via $(LINKCHECK_SERVER), will report broken links"
	linkchecker --check-extern $(LINKCHECK_PARAMS)
	@echo "Links PASS"



