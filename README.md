---
title: README
author: Christian Külker
version: 0.1.1
date: 2022-05-06

---

# Abstract

This document describes briefly the aim and content of the
`pankyll-theme-simplicissimus-example` repository. The goal is to show the
configuration and usage of the theme [Simplicissimus] by providing a working
example with a directory tree that can be used as a base to build up a new
site.

![Github license](https://img.shields.io/github/license/ckuelker/pankyll-theme-simplicissimus-example.svg)
![Github issues](https://img.shields.io/github/issues/ckuelker/pankyll-theme-simplicissimus-example.svg?style=popout-square)
![Github code size in bytes](https://img.shields.io/github/languages/code-size/ckuelker/pankyll-theme-simplicissimus-example.svg)
![Git repo size](https://img.shields.io/github/repo-size/ckuelker/pankyll-theme-simplicissimus-example.svg)
![Last commit](https://img.shields.io/github/last-commit/ckuelker/pankyll-theme-simplicissimus-example.svg)

## History

| Version | Date       | Notes                                                |
| ------- | ---------- | ---------------------------------------------------- |
| 0.1.1   | 2022-05-06 | Change cfg.yaml, README.md                           |
| 0.1.0   | 2020-04-21 | Initial release                                      |

# Introduction

More than a 1000 words, a life example can show how things are done the right
away. This [Pankyll] theme [Simplicissimus] example is a pre-configured
[Pankyll] theme with a little bit of content to see how easy it is to set up a
[Pankyll] site with a [Simplicissimus] theme.

# Prerequisites

**TLTR:**

Requires [Pankyll] and on [Debian] install the following:

```bash
aptitude install pandoc make
git clone --recursive https://github.com/ckuelker/pankyll-theme-simplicissimus-example.git
```

## Pankyll (Mandatory)

We assume that [Pankyll] is installed and that the script `pankyll` is in
your `PATH`. Read the [Pankyll] README document.

## Pandoc (Mandatory)

[Pandoc] is expected to be installed. While it is possible to run `pankyll`
with `pandoc` version 1.x.x it will not produce good results. [Pankyll] was
tested with `pandoc` version 2.2.1 and should give good results.

**Installation for Debian:**

```bash
aptitude install pandoc
```
## Make (Optional)

A control file (Makefile) is used to control easy build. If you do not want to
use it just run the `pankyll` command inside your project directory. If you
want to use it see the usage section.

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

Build the site

```bash
cd pankyll-theme-simplicissimus-example
make submodule-update # this takes some time
make realclean
make build
```

Start a server

```bash
make server
```

Or shorter:

```bash
make submodule-update realclean build server
```

Open a browser and access the URL [http://localhost:8004](http://localhost:8004)

# Author

    Christian Külker <c@c8i.org>

# License And Copyright

    Copyright (C) 2020, 2022 by Christian Kuelker, see LICENSE file.

[Simplicissimus]: https://github.com/ckuelker/pankyll-theme-simplicissimus
[Pankyll]: https://github.com/ckuelker/pankyll
[Pandoc]:  https://pandoc.org/
[Debian]:  https://www.debian.org/
