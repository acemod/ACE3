---
layout: wiki
title: Disposable framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Making a launcher disposable


### 1.1 CfgWeapons
```
class CfgWeapons {
    
    class Launcher_Base_F;

    class launch_banana: Launcher_Base_F {
        ACE_UsedTube = "launch_banana_Used_F";      // The class name of the used tube.
        magazines[] = {"ACE_PreloadedMissileDummy"};  // The dummy magazine
    };

    class launch_banana_Used_F: launch_banana {   // the used tube should be a sub class of the disposable launcher
        scope = 1;
        ACE_isUsedLauncher = 1;
        author = "someone";
        displayName = "Used banana launcher";
        descriptionShort = "A used banana launcher";
        magazines[] = {"ACE_FiredMissileDummy"};  // This will disable the used launcher class from being fired again.
        //picture = "";
        //model = "";
        weaponPoolAvailable = 0;
    };
};
```

### 1.2 Notes

- This is just the necessary to make a launcher disposable, this is not a guide to make your own launcher.
