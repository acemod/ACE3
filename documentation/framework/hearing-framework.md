---
layout: wiki
title: Hearing framework
description:
group: framework
order: 5
parent: wiki
---


## 1. Adding ace_hearing support for helmets
```c++
class CfgWeapons {
    class H_HelmetB;

    class H_superHelmet: H_HelmetB {
         GVAR(protection) = 0.80;  // Protection against deafening (0 = less, 1 = more)
         GVAR(lowerVolume) = 0.60;  // Muffling of the sound (0 = less, 1 = more)
    };
};
```

### 1.1 Notes
- The protection is a multiplier and not an absolute value, you can still be deafened with a value of 1.
- Same as above for the sound muffling.
