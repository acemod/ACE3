---
layout: wiki
title: Javelin Framework
description: Explains how to set-up Javelin-style locking system to a launcher.
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
    class MyLauncher {
        ace_javelin_enabled = 1;  // Enable Javelin-style locking (0-disabled, 1-enabled)
        weaponInfoType = "ACE_RscOptics_javelin";  // Inteface
        modelOptics = "\z\ace\addons\javelin\data\reticle_titan.p3d";  // Optics model
        canLock = 0;  // Disable vanilla locking (0-disabled, 1-enabled)
        lockingTargetSound[] = {"", 0, 1};  // Locking sound
        lockedTargetSound[] = {"", 0, 1};  // Target acquired sound
    };
};
```
