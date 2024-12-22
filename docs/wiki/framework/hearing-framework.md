---
layout: wiki
title: Hearing Framework
description: Explains how to set-up headgear with ACE3 hearing system.
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
    class MyHelmet {
<<<<<<< HEAD
         ace_hearing_protection = 0.80;  // Protection against deafening (0 to 1, higher means more protection)
         ace_hearing_lowerVolume = 0.60;  // Muffling of the sound (0 to 1, higher means more muffling)
=======
        ace_hearing_protection = 0.80;  // Protection against deafening (0 to 1, higher means more protection)
        ace_hearing_lowerVolume = 0.60; // Muffling of the sound (0 to 1, higher means more muffling)
        ace_hearing_hasEHP = 1;         // Is electronic hearing protection (0 to disable, 1 to enable)
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
    };
};
```

The protection/muffling is a multiplier and not an absolute value, you can still be deafened/muffled with a value of 1.
