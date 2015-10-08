---
layout: wiki
title: Merging Pull Requests
description: 
group: development
parent: wiki
order: 5
---

Who's responsible for merging pull requests.

All authors must add themselves to the AUTHORS.txt file **with a valid email address**.


#### Changes to Existing Addons
The people responsible for merging changes to existing addons are the maintainers listed in the README.md file of the respective addon folder.

If the changes consist of trivial updates, such as spelling or indentation fixes:

```diff
     valueA = 12;
     valueB = 31;
-     valueC =2;
+    valueC = 2;
```

...then the PR can be merged right away by one of the maintainers.

Non-trivial pull requests remain open for a minimum of 48 hours, to give all other contributors time to comment on potential issues, and are then merged by a maintainer, should no issues arise.


#### New Addons / Other Changes
If a pull request adds a new addon, or changes something else, like the README, everyone has 72 hours to comment on the changes. After that, one of the team leads ([NouberNou](https://github.com/NouberNou), [KoffeinFlummi](https://github.com/KoffeinFlummi), [Glowbal](https://github.com/Glowbal)) will merge it.

Trivial changes such as spelling fixes can be merged immediately by any contributor.
