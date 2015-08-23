---
layout: wiki
title: javelin framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Adding javelin style locking to your Launcher

```c++
class CfgWeapons {
    class your_launcher : launch_O_Titan_F {
        ace_javelin_enabled = 1;  // enable javelin style locking
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = "\z\ace\addons\javelin\data\reticle_titan.p3d";

        canLock = 0;  // disable vanilla locking
        lockingTargetSound[] = {"",0,1};  // locking sound
        lockedTargetSound[] = {"",0,1};  // target acquired sound
    };
};
```
