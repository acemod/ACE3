---
layout: wiki
title: Magazine Repack Framework
description: Explains how to set-up the disable repack.
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

### 1.1 Disable Magazine Repack

```cpp
class CfgMagazines {
    class MyMagazine {
        // Disables the ability to repack this magazine
        ace_disableRepacking = 1;
    };
};
```
