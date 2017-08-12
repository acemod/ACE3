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
    <p>These are just the necessary changes to make a launcher disposable, this is not a guide to make your own launcher.</p>
</div>

## 1. Making a launcher disposable

### 1.1 CfgMagazines
```cpp
class CfgMagazines {
    class ACE_PreloadedMissileDummy_Base;
    class ACE_PreloadedMissileDummy_Banana: ACE_PreloadedMissileDummy_Base { // Dummy Banana magazine. Make sure the magazine you make for your launcher is a child of ACE_PreloadedMissileDummy_Base. Do not set a mass for this magazine.
        ammo = "Banana_Missile";
        initSpeed = 40;
        maxLeadSpeed = 40;
    };
};
```

### 1.2 CfgWeapons

```cpp
class WeaponSlotsInfo;
class CfgWeapons {
    class Launcher_Base_F;
    class launch_Banana_F: Launcher_Base_F {
        author = "grandBanana";
        displayName = "Banana Launcher";
        descriptionShort = "A true weapon of banana destruction";
        model = "\A3\weapons_f\launchers\nlaw\nlaw_loaded_F"; 
        magazines[] = {"ACE_PreloadedMissileDummy_Banana"};  // The dummy magazine
        ACE_UsedTube = "launch_Banana_Used_F";      // The class name of the used tube. This is required for your launcher to work on the disposables framework.
        ace_disposable_hasPreparation = 0; // If your launcher has any sort of preparation animation such as removing safeties, flipping up sights, or anything else, set this to 1. This is handled by having the player "reload" the launcher.
        class WeaponSlotsInfo : WeaponSlotsInfo{
            mass = 180; //The mass of the launcher should include any mass of the missile. Don't put the missile mass in CfgMagazines.
        };
    };
    class launch_Banana_Used_F: launch_Banana_F {   // the used tube should be a sub class of the disposable launcher
        scope = 1;
        ACE_isUsedLauncher = 1; //Your used launcher must have this set to 1.
        ace_disposable_hasPreparation = 0; //This should always be set to 0 for a used launcher.
        author = "grandBanana";
        displayName = "Used banana launcher";
        descriptionShort = "A used banana launcher";
        model = "\A3\weapons_F\launchers\nlaw\nlaw_F.p3d";
        magazines[] = {"ACE_FiredMissileDummy"};  // This will disable the used launcher class from being fired again.
        weaponPoolAvailable = 0;
        class WeaponSlotsInfo : WeaponSlotsInfo{
            mass = 100; //This should be the mass of just the tube itself, not including the missile.
        };
    };
};
```
