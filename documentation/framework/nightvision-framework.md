---
layout: wiki
title: nightvision framework
description:
group: framework
order: 5
parent: wiki
---
## 1. Configuring your NVGs

```c++
class CfgWeapons {
    class Binocular;
    class your_nvgs: Binocular {
        displayName = "your nvg";  // name displayed in the inventory
        ACE_NightVision_grain = 0.75;  // amount of grain (dots) on the screen (0= less)
        ACE_NightVision_blur = 0.055;  // blur amount, (0= less) keep low
        ACE_NightVision_radBlur = 0.001;  // radial blur amount (0=less) keep low
    };
};
```

- There's no escape here, you'll have to fiddle with the values to find the value that please you.
- `ACE_NightVision_grain` can be higher than 1, it's on 2.25 for gen1 goggles for example.
