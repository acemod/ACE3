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
      GVAR(border) = QPATHTOF(data\nvg_mask_binos_4096.paa); // Edge mask for different tube configurations. Three types: mono, bino and quad.
      GVAR(bluRadius) = 0.13; // Edge blur radius.
      GVAR(eyeCups) = 1; // Does have eyecups.
      GVAR(generation) = 4; // Generation 4. Affects image quality.
  };
};
```
