---
layout: wiki
title: Branching and Release
description: 
group: development
parent: wiki
order: 5
---


## 1 Versioning

For ACE3 we use an versioning strategy based on <a href="http://semver.org/">Semver</a>. This means our version numbering is structured `MAJOR.MINOR.PATCH.BUILD`. 

Because this modification is for Arma and backwards compatability is not always possible, our `MAJOR.MINOR.PATCH.BUILD` rules are slightly different. We increment the:

    MAJOR version when we switch to a new arma version (ie Arma 4 or standalone expansion),
    MINOR version when we add new features or large amount of bug fixes.
    PATCH version when a release only contains bug fixes.

## 2 Branching and releases

We have a release scheduled every 2 weeks on a Tuesday. On the Friday before release, the project management will decide whether or not this scheduled release will continue. When continuing  with the release, the current `master branch` will be merged into the `release branch`. The release branch will not contain any direct commits and no other branches will be merged into this branch. The exception being `hotfixes`, which are branched off `Release` and merged back into `Release` and `Master`. 

`Hotfixes` are fixes for critical bugs that prevent stable gameplay with the currently available version of ACE3.

During this release process between the Friday and Tuesday, the day of release, work can continue on as normal on the `Master branch`. This includes new features, bug fixes that won't make it for release or other work. These will not be merged into the `Release branch` until the next release cycle, normally 2 weeks later.

### 2.1 Branching

* New features, bug fixes that are not a hotfix or other work will always be branched off `master` or another branch but never a `hotfix` or the `Release branch`. 
* Hotfixes are always branched off the `Release branch`
* The release branch is never merged or deleted. Only master or hotfixes are allowed to merge into the `Release branch`. 

### 2.2 Diagram

<a href="{{ site.baseurl }}/img/wiki/development/release_and_branching.jpg"><img src="{{ site.baseurl }}/img/wiki/development/release_and_branching.jpg" alt="Release and branching flowchart" /></a>
