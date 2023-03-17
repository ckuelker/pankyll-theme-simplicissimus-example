---
title: README
author: Christian Külker
version: 0.1.5
date: 2023-03-17

---

# Abstract

This document briefly describes the purpose and contents of the
`pankyll-theme-simplicisimus-example` repository.  The goal of this repository is
to show the configuration and usage of the [Pankyll] [Simplicissimus] theme by
providing a working example with a directory tree that can be used as a base
for building a new site.

![Github license](https://img.shields.io/github/license/ckuelker/pankyll-theme-simplicissimus-example.svg)
![Github issues](https://img.shields.io/github/issues/ckuelker/pankyll-theme-simplicissimus-example.svg?style=popout-square)
![Github code size in bytes](https://img.shields.io/github/languages/code-size/ckuelker/pankyll-theme-simplicissimus-example.svg)
![Git repo size](https://img.shields.io/github/repo-size/ckuelker/pankyll-theme-simplicissimus-example.svg)
![Last commit](https://img.shields.io/github/last-commit/ckuelker/pankyll-theme-simplicissimus-example.svg)

## History

| Version | Date       | Notes                                                |
| ------- | ---------- | ---------------------------------------------------- |
| 0.1.5   | 2023-03-17 | Update content (pankyll-documentation 0.2.1)         |
|         |            | Update pandoc  (pankyll-pandoc 0.1.3)                |
|         |            | Update theme   (pankyll-theme-newspaper 0.1.5)       |
|         |            | Fix YAML README.md, shell -> bash, .gitignore        |
|         |            | Improve writing: README, cfg.yaml, Makefile          |
| 0.1.4   | 2022-05-20 | Makefile, README, theme 0.1.1, feature in cfg.yaml   |
| 0.1.3   | 2022-05-09 | Makefile                                             |
| 0.1.2   | 2022-05-09 | README.md                                            |
| 0.1.1   | 2022-05-06 | Change cfg.yaml, README.md                           |
| 0.1.0   | 2020-04-21 | Initial release                                      |

# Introduction

More than a 1000 words, a life example can show how things are done the right
way. This [Pankyll] Theme [Simplicissimus] example is a pre-configured Pankyll
Theme with a little content to see how easy it is to set up a Pankyll Site
with a Simplicissimus theme.

# Prerequisites

**TLTR:**

Requires [Pankyll] and on [Debian] install the following:

As root

```bash
aptitude install pandoc make
```

As user

```bash
export URL=https://github.com/ckuelker/pankyll-theme-simplicissimus-example.git
git clone --recursive $URL
```

## Pankyll

We assume that [Pankyll] is installed and that the script `pankyll` is in your
`PATH`. See the Pankyll [README.md] file for more information.

## Pandoc

[Pandoc] is expected to be installed. While it is possible to run `pankyll`
with `pandoc` 1.x.x, it will not produce good results. [Pankyll] has been
tested with version 2.2.1 and should give good results. Unfortunately Pandoc
2.18 is not supported at the moment.

**Installation for Debian:**

```bash
aptitude install pandoc
```

## Make (Optional)

A control file (Makefile) is used to control easy build. If you do not want to
use it, just run the `pankyll` command in your project directory. If you want
to use it, see the usage section.

**Installation for Debian:**

```bash
aptitude install make
```

# Installation

Clone the example repository and its sub-modules

```bash
git clone --recursive https://github.com/ckuelker/pankyll-theme-simplicissimus-example.git
```

# Usage

Update, build and see the site:

```bash
cd pankyll-theme-simplicissimus-example
make submodule-update
make submoduleclean
make submodule-pull
make realclean
make build
make server
```

Or all at once:

```bash
make all
```

Open a browser and access the URL [http://localhost:8004](http://localhost:8004)

# Author

    Christian Külker <c@c8i.org>

# License And Copyright

    Copyright (C) 2020, 2022 - 2023 by Christian Kuelker, see LICENSE file.

[Debian]: https://www.debian.org/
[Newspaper]: https://github.com/ckuelker/pankyll-theme-newspaper/
[Pandoc]: https://pandoc.org/
[Pankyll]: https://www.pankyll.org/
[Rankle]: https://github.com/ckuelker/pankyll-theme-rankle
[README.md]: https://github.com/ckuelker/pankyll
[Simplicissimus]: https://github.com/ckuelker/pankyll-theme-simplicissimus
