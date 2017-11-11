---
layout: wiki
title: Sitting Framework
description: Explains how to set-up sitting objects (eg. chairs) with ACEX sitting system.
group: framework
order: 5
parent: wiki
mod: acex
version:
  major: 3
  minor: 2
  patch: 0
redirect_from: "/wiki/framework/sitting-framework.md"
---

_Sitting has been moved from ACE3 (in v3.8.0) to ACEX._


## 1. Requirements

Object must inherit from `ThingX` or any of its sub-classes.

Object must have Extended Event Handler (XEH) enabled (this is not the case for the majority of vanilla objects in `ThingX` class), configuration entry on how to do that is shown below.


## 2. Config Values

```cpp
class CfgVehicles {
    class MyChair {
        acex_sitting_canSit = 1;  // Enable sitting
        acex_sitting_sitDirection = 180;  // Direction relative to object
        acex_sitting_sitPosition[] = {0, -0.1, -0.45};  // Position relative to object (may behave weird with certain objects)
        XEH_ENABLED;  // Enable XEH (only necessary if XEH is not yet enabled for this class or the one this inherits from)
    };
};
```
