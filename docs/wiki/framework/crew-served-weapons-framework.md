---
layout: wiki
title: Crew Served Weapons Framework
description: Explains how to add new Crew Served Weapons to ACE3
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Making a new Crew Served Weapon

To convert a static weapon into a crew served weapon, you need to create the following:

- A proxy weapon (optional)
- A carryable weapon that can be mounted on a tripod
- Carryable weapon magazines
- The CSW config in the static weapon

For the following examples, we are going to assume you are modifying your existing static weapon named `prefix_hmg` and that you are using the same prefix. If you are making a compatibility patch for a third party mod, you should use your own prefix. Do not use `ace` as your prefix.

### 1.1 Proxy Weapon

Because the magazine loading time is already handled by the ACE interaction, a proxy weapon with a very low loading time is used. It automatically replaces the default weapon of the turret when CSW is enabled.

A proxy weapon isn't required for a CSW to work. If a CSW uses the default weapons, the reload times will just be longer.

```cpp
class CfgWeapons {
    class prefix_hmg_weapon;
    class prefix_hmg_weapon_proxy: prefix_hmg_weapon {
        magazineReloadTime = 0.5;
    };
};
```

### 1.2 Carryable Weapon

Carried CSW weapons are technically rocket launchers. This allows the player to carry both a CSW weapon and a backpack with magazines for the CSW.
ACE 3.18.0 added support for primary weapons to be used as CSW weapons, but not tripods.

```cpp
class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class prefix_hmg_carry: Launcher_Base_F {
        // displayName, author, model and picture are omitted and up to you
        scope = 2;
        modes[] = {};

        class ACE_CSW {
            type = "weapon"; // Use "weapon" for weapons or "mount" for tripods - see below
            deployTime = 4;  // How long it takes to deploy the weapon onto the tripod
            pickupTime = 4;  // How long it takes to disassemble weapon from the tripod
            class assembleTo {
                // What tripod can this weapon deploy onto, and what vehicle will it spawn when it is deployed
                ace_csw_m3Tripod = "prefix_hmg";
            };
        };

        class WeaponSlotsInfo: WeaponSlotsInfo {
            // One WeaponSlot with a positive value for iconScale forces game to use icon overlay method
            // Required, because the inventory icon has no accessory variants
            class MuzzleSlot {
                iconScale = 0.1;
            };

            // Don't forget to set mass to a reasonable value
            // We use mass in pounds * 10
            mass = 840; // 84 lb / 38 kg
        };
    };
};
```

### 1.3 Carryable Magazines

Vehicle magazines usually don't have inventory pictures or a 3D model. Because of this, carryable magazines need to be created for the CSW. If one of the existing CSW magazines or an infantry weapon magazine would fit your weapon, you don't need to create another magazine. Using one of the existing CSW magazines is preferred to prevent confusing players and mission makers.

```cpp
class CfgMagazines {
    class prefix_100rnd_hmg_mag;
    class prefix_100rnd_hmg_csw_mag: prefix_100rnd_hmg_mag {
        scope = 2;
        type = 256;  // Must be 256 to show up in Arsenal
        count = 100;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        ACE_isBelt = 1; // Enables belt linking for this magazine
    };
};
```

ACE converts the carryable magazines to the vehicle magazines when loading them. To enable this conversion, the ACE_CSW_Groups config needs to be extended.

```cpp
class ACE_CSW_Groups {
    // Using a custom carryable magazine
    class prefix_100rnd_hmg_csw_mag { // Same name as the carryable magazine
        prefix_100rnd_hmg_mag = 1;    // Vehicle magazine that will be loaded when loading this magazine
    };
    
    // Using an existing CSW magazine
    class ace_csw_100Rnd_127x99_mag {
        banana_dummy_ammo = 1;
    };
    
    /*
        Carryable magazines already defined by ACE:
        - ace_csw_100Rnd_127x99_mag
        - ace_csw_100Rnd_127x99_mag_red
        - ace_csw_100Rnd_127x99_mag_green
        - ace_csw_100Rnd_127x99_mag_yellow
        - ace_csw_50Rnd_127x108_mag
        - ace_csw_20Rnd_20mm_G_belt
        - ace_1Rnd_82mm_Mo_HE
        - ace_1Rnd_82mm_Mo_Smoke
        - ace_1Rnd_82mm_Mo_Illum
        - ace_1Rnd_82mm_Mo_HE_Guided
        - ace_1Rnd_82mm_Mo_HE_LaserGuided
    */
};
```

### 1.4 CSW Config

The final step is to let ACE know how to disassemble and load the static weapon.

```cpp
class CfgVehicles {
    class StaticMGWeapon;
    class prefix_hmg: StaticMGWeapon {
        class ACE_CSW {
            enabled = 1; // Enables ACE CSW for this weapon              
            proxyWeapon = "prefix_hmg_weapon_proxy"; // The proxy weapon created above. This can also be a function name that returns a proxy weapon - passed [_vehicle, _turret, _currentWeapon, _needed, _emptyWeapon]
            magazineLocation = "_target selectionPosition 'magazine'"; // Ammo handling interaction point location
            disassembleWeapon = "prefix_hmg_carry";  // Carryable weapon created above
            disassembleTurret = "ace_csw_m3Tripod";  // Which static tripod will appear when weapon is disassembled
            ammoLoadTime = 7;   // How long it takes in seconds to load ammo into the weapon           
            ammoUnloadTime = 5; // How long it takes in seconds to unload ammo from the weapon
            desiredAmmo = 100;  // When the weapon is reloaded it will try and reload to this ammo capacity
            // Optional callback function for when the CSW gets disassembled, called with [tripod, staticWeapon]
            disassembleFunc = "prefix_fnc_handleDisassembly";
        };
    };
};
```

## 2. Making a new Tripod

If none of the existing ACE tripods fit your weapon, you can create your own. Creating a tripod is similar to creating a crew served weapon and consists of two parts:

- A carryable tripod
- A placeable static tripod

### 2.2 Carryable Tripod

Creating the carryable tripod is similar to [creating a carryable weapon](#12-carryable-weapon). The config besides the `ACE_CSW` class has been omitted for brevity and is the same as above.

```cpp
class CfgWeapons {
    class Launcher_Base_F;
    class prefix_tripod_carry: Launcher_Base_F {
        class ACE_CSW {
            type = "mount"; // Use "mount" for tripods
            deployTime = 4; // How long it takes to deploy the tripod
            pickupTime = 4; // How long it takes to disassemble the tripod
            deploy = "prefix_tripod"; // what vehicle will spawn when the tripod is deployed
        };
    };
};
```

### 2.1 CfgVehicles

When deploying a tripod, a static vehicle is spawned to mount weapons onto. Make sure this vehicles interaction point is in a suitable position.

```cpp
class CfgVehicles {
    class ace_csw_baseTripod;
    class prefix_tripod: ace_csw_baseTripod {
        class ACE_CSW {
            disassembleTo = "prefix_tripod_carry";
        };
    };
};
```

## 3. Additional Configuration Parameters

There are some additional config parameters available to extend functionality.

### 3.1. `allowFireOnLoad`

This option will make it so that whenever the weapon is reloaded, it will fire automatically. The intended use case of this is for mortars, where
when the shell hits the fixed firing pin it shoots immediately.

```cpp
class CfgVehicles {
    class MyWeapon {
        class ace_csw {
            // other options
            allowFireOnLoad = 1;
            /*
            * Available Options:
            *   0 - Disabled
            *   1 - Enabled, togglable on the gun via ACE interact
            *   2 - Enabled, and forced on.
            */
        };
    };
}
```
