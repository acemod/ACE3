---
layout: wiki
title: Goggles Framework
description: Explains how to set-up goggles with ACE3 goggles system.
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
class CfgGlasses {
    class MyGoggles {
        ace_color[] = {0, 0, -1};  // Post-proccess color
        ace_tintAmount = 8;  // Amount of tint applied to the color
        ace_resistance = 1;  // Resistance to breaking (0 or 1 or 2)
        ace_protection = 0;  // Provides protection (0-no, 1-yes)
        ace_overlay = "";  // (Optional) Default overlay image path ("" for none)
        ace_overlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";  // (Optional) Dirt overlay image path
        ace_overlayCracked = "mod\textures\HUD\Cracked.paa";  // (Optional) Cracked overlay image path
        ace_dustPath = "mod\textures\fx\dust\dust1.paa";  // (Optional) Dust overlay image path
    };
};
```


## 2. Events

### 2.1 Listenable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`ace_glassesChanged` | Glasses Changed | `[_unit, _glassesClass]` | Local
`ace_glassesCracked` | Glasses Cracked | `[_unit]` | Local
