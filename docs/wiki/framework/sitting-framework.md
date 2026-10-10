---
layout: wiki
title: Sitting Framework
description: Explains how to set-up sitting objects (e.g. chairs) with ACE sitting system.
group: framework
order: 5
parent: wiki
mod: acex
version:
  major: 3
  minor: 2
  patch: 0
redirect_from: "/wiki/frameworkx/sitting-framework.md"
---

## 1. Requirements

Object must have `acex_sitting_canSit = 1` defined.

## 2. Config Values

```cpp
class CfgVehicles {
    class MyChair {
        acex_sitting_canSit = 1;  // Enable sitting
        acex_sitting_sitDirection = 180;  // Direction relative to object. If a sitting object has multiple sitting spots and they should have different directions, make this into an array of relative directions (e.g. {0, 180}). If all sitting spots have the same relative direction, a single number is sufficient (e.g. 180).
        acex_sitting_sitPosition[] = {0, -0.1, -0.45};  // Position relative to object (may behave weird with certain objects). For multiple seats, make this into an array of relative positions (e.g. {{0, -0.1, -0.45}, {{1, -0.1, -0.45}}}).
        acex_sitting_interactPosition[] = {0, -0.1, -0.45};
        ace_sitting_animations[] = {"ace_sitting_HubSittingChairA_idle1"}; // Overwrite random animation pool
    };
};
```
