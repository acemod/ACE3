---
layout: wiki
title: Disposables Framework
description: Explains how to set-up custom disposable launchers with the ACE3 disposables system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>This is just the necessary to make a launcher disposable, this is not a guide to make your own launcher.</p>
</div>

## 1. Making a launcher disposable

### 1.1 CfgWeapons

```cpp
class CfgWeapons {
    class Launcher_Base_F;
    class launch_banana: Launcher_Base_F {
        ACE_UsedTube = "launch_banana_Used_F";  // The class name of the used tube
        magazines[] = {"ACE_PreloadedMissileDummy"};  // The dummy magazine
    };
    class launch_banana_Used_F: launch_banana {  // The used tube should be a sub class of the disposable launcher
        scope = 1;
        ACE_isUsedLauncher = 1;
        author = "grandBanana";
        displayName = "Used banana launcher";
        descriptionShort = "A used banana launcher";
        magazines[] = {"ACE_FiredMissileDummy"};  // This will disable the used launcher class from being fired again
        //picture = "";  // Not supported yet
        //model = "";  // Not supported yet
        weaponPoolAvailable = 0;
    };
};
```
