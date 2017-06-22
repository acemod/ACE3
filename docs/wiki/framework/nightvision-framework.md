---
layout: wiki
title: Night Vision Framework
description: Explains how to set-up night vision goggles with ACE3 night vision system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Config Values

```cpp
class CfgWeapons {
    class MyNightVision {
        displayName = "Banana NVGs";  // Name displayed in the inventory
        ace_nightVision_grain = 0.75;  // Amount of grain (dots) on the screen (more means more grain) - can be higher than 1
        ace_nightVision_blur = 0.055;  // Blur amount (more means more blur) - keep low values!
        ace_nightVision_radBlur = 0.001;  // Radial blur amount (more means more blur) - keep low values!
    };
};
```
