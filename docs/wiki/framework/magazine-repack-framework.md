---
layout: wiki
title: Magazine Repack Framework
description: Explains how to disable repacking.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 18
  patch: 0
---

## 1. Config Values

### 1.1 Disable Magazine Repacking

```cpp
class CfgMagazines {
    class MyMagazine {
        // Disables the ability to repack this magazine
        ace_disableRepacking = 1;
    };
};
```
