---
layout: wiki
title: Branching and Release
description: This page describes the ACE3 release and branching system
group: development
parent: wiki
order: 5
---


## 1. Versioning
For ACE3 we use an versioning strategy based on [semver](http://semver.org). This means our version numbering has the following structure: **`MAJOR.MINOR.PATCH.BUILD`**

Because this modification is for Arma and backwards compatibility is not always possible, our `MAJOR.MINOR.PATCH.BUILD` rules are slightly different. We increment the:

```
MAJOR version when we switch to a new arma version (i.e. Arma 4 or standalone expansion)
MINOR version when we add new features or large amount of bug fixes
PATCH version when a release contains only bug fixes.
```

## 2. Project goals

Following the release of ACE 3.4.1, we have adopted a system involving collaborative project goals. Following `MINOR` releases the ACE development team will decide on a goal to work towards for the next minor increment (whether that be developing a new feature, overhauling an existing feature or simply enhancing a certain area of the project).

As ACE is primarily a hobby project, project goals will never operate on a fixed deadline and nobody is required to contribute to them. They are simply a mechanism of directing the project's development between versions.

Individual developers are free to continue working on the project at their own discretion and releases will otherwise operate as usual. Meaning that if features unrelated to the goal are complete, there will still be a minor version increment when the next release is made.

Whenever a project goal is chosen a new issue will be made for the purpose of discussing and documenting the current goal's development in a centralized location.

## 3. Branching and releases

ACE releases are generally scheduled for a Tuesday a week or two in advance. On the Friday before release, the project management will decide whether or not this scheduled release will continue. When continuing  with the release, the current `master` branch will be merged into the `release` branch. The `release` branch will not contain any direct commits and no other branches will be merged into this branch. The exception being hotfixes, which are branched off `release` and merged back into `release` and `master`.

Hotfixes are fixes for critical bugs that prevent stable gameplay with the currently available version of ACE3.

During this release process between the Friday and Tuesday, the day of release, work can continue on as normal on the `master` branch. This includes new features, bug fixes that won't make it for release or other work. These will not be merged into the `release` branch until the next release cycle.

### 3.1 Branching

* New features, bug fixes that are not a hotfix or other work will always be branched off `master` or another branch but never a `hotfix` or the `release` branch.
* Hotfixes are always branched off the `release` branch
* The `release` branch is never merged or deleted. Only `master` or hotfixes are allowed to merge into the `release` branch.

### 3.2 Diagram

<a href="{{ site.baseurl }}/img/wiki/development/release_and_branching.jpg"><img src="{{ site.baseurl }}/img/wiki/development/release_and_branching.jpg" alt="Release and branching flowchart" /></a>
