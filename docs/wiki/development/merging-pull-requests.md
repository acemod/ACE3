---
layout: wiki
title: Merging Pull Requests
description: This page describes our process of how we merge pull requests.
group: development
parent: wiki
order: 5
---

This page describes the process of how we merge pull requests.

All contributors may add themselves to the `AUTHORS.txt` file (email address optional) if they wish.

The `authors` array property in `config.cpp` files will generally contain the original component author(s) and is otherwise reserved for individuals who have contributed significantly to a component (decided at the discretion of the ACE team). Do not add yourself without consent.

The `author` string property in `config.cpp` files will always contain the common ACE team string (`ECSTRING(common,ACETeam)`) to reflect component maintenance and keep things consistent.

#### Merge Criteria

All pull requests must receive approval from a maintainer and must pass all required continuous integration checks before they can be merged.

If the changes consist of trivial updates, such as spelling or indentation fixes:

```diff
     valueA = 12;
     valueB = 31;
-     valueC =2;
+    valueC = 2;
```

...then the PR can be merged right away by one of the maintainers.

Non-trivial pull requests should ideally be thouroughly reviewed by multiple maintainers or at least one maintainer highly familiar with any code modified.
