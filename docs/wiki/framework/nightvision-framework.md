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
  minor: 12
  patch: 0
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>Changed in 3.12.0.</p>
</div>

## 1. Config Values

```cpp
class CfgWeapons {
  class myNightVision: NVGoggles {
      scope = 1;
      modelOptics = "";
      author = ECSTRING(common,ACETeam);
      descriptionShort = "Biocular nightvision goggles";
      displayName = "NV Goggles (Bio)";
      ace_nightvision_border = QPATHTOF(data\nvg_mask_binos_4096.paa); // Edge mask for different tube configurations. Three types: mono, bino and quad.
      ace_nightvision_bluRadius = 0.13; // Edge blur radius.
      ace_nightvision_colorPreset[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.3, 1.2, 0.0, 0.9}, {6, 1, 1, 0.0}}; // Green preset
      ace_nightvision_eyeCups = 1; // Does have eyecups.
      ace_nightvision_generation = 4; // Generation 4. Affects image quality.
  };
};
```

## 2. Color Presets

Additional color presets

```cpp
ace_nightvision_colorPreset[] = {0.0, {0.0, 0.0, 0.0, 0.0}, {1.1, 0.8, 1.9, 0.9}, {1, 1, 6, 0.0}}; // White Phosphor Preset
```

## 3. Brightness Limits

```cpp
ace_nightvision_const_maxBrightness = 0; // Defaults, change at your leisure
ace_nightvision_const_minBrightness = -6;
```
