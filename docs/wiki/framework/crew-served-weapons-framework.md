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

### 1.1 CfgVehicles

```cpp
class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions;
    };
    class StaticMGWeapon: StaticWeapon {
        class Turrets {
            class MainTurret;
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };
    class banana_csw: StaticMGWeapon {
        class ace_csw {
            enabled = 1; // whether or not the weapon is affected by CSW                
            proxyWeapon = QGVAR(HMG_Static); // The weapon that will be added to the CSW on initialization. Used to ensure lower ammo-reload time when using Ammo Handling
            magazineLocation = "_target selectionPosition 'magazine'"; // The location of the magazine. Where the action for ammo-handling will appear on the weapon
            disassembleWeapon = QGVAR(staticHMGCarry); // What the weapon will disassemble to
            disassembleTurret = QGVAR(m3TripodLow); // Which tripod will appear when weapon has been disassembled
            ammoLoadTime = 7; // How long it takes in seconds to load ammo into the weapon           
            ammoUnloadTime = 5; // How long it takes in seconds to unload ammo from the weapon
            desiredAmmo = 69; // When the weapon is reloaded it will try and reload to this ammo capacity
            disassembleFunc = "myCoolFunction.sqf"; // A callback function for when the CSW gets disassembled. Arguments: [tripod, staticWeapon]
        };
    };
};
```

### 1.2 CfgMagazines

```cpp
class CfgMagazines {
    class 100Rnd_127x99_mag; // Example magazine used - does not have to be this
    class banana_ammo: 100Rnd_127x99_mag {
        scope=2; // Needs to be 2 to make sure it shows up in Arsenal
        type=256; // Must be 256 to show up in Arsenal
        count = 100; // How much ammo gets added per "Load Ammo" selection
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // default ammo box model
        //ace_isbelt = 1; // Needed if your magazine has belt linking
    };
};
```

### 1.3 CfgWeapons

```cpp
class CfgWeapons {
    class Launcher_Base_F;
    class banana_carry_weapon: Launcher_Base_F {
        class ACE_CSW {
            type = "weapon"; // What type of carry it is. Must always be "weapon" for the carry weapon
            deployTime = 4; // How long it takes to deploy the weapon onto the tripod
            pickupTime = 4; // How long it takes to disassemble weapon from the tripod
            class assembleTo {
                ace_csw_m3Tripod = "banana_csw_mod1"; // What tripod can this weapon deploy onto, and what vehicle will it spawn when it is deployed
                banana_tripod = "banana_csw";
            };
        };
    };
    
    class HMG_Static;
    class banana_proxy_weapon: HMG_Static {
        magazineReloadTime = 0.5; // Proxy weapons are spawned onto the CSW when it is assembled. Because ammo loading times use defined values in the magazine, this number needs to be low to ensure low latency
    };
};
```

### 1.4 CfgMagazineGroups

```cpp
    class ace_csw_groups { // Ammo that can be loaded into this CSW
        class banana_ammo { // The magazine which the player can place into their inventory
            banana_dummy_ammo = 1; // Magazine that is loaded into the weapon as per CfgWeapons >> weapon >> magazines
        };
        
        // Optional
        class ace_csw_100Rnd_127x99_mag { // default magazine that CSW already implements
            banana_dummy_ammo = 1;
        };
        
        /*
          Ammo types already defined by CSW:
            - ace_csw_100Rnd_127x99_mag
            - ace_csw_100Rnd_127x99_mag_red
            - ace_csw_100Rnd_127x99_mag_green
            - ace_csw_100Rnd_127x99_mag_yellow
            - ace_csw_50Rnd_127x108_mag
            - ace_csw_20Rnd_20mm_G_belt
            - ACE_1Rnd_82mm_Mo_HE
            - ACE_1Rnd_82mm_Mo_Smoke
            - ACE_1Rnd_82mm_Mo_Illum
            - ACE_1Rnd_82mm_Mo_HE_Guided
            - ACE_1Rnd_82mm_Mo_HE_LaserGuided
            - Titan_AT
            - Titan_AA
        */
    };
```

## 2. Making a new Tripod

### 2.1 CfgVehicles

```cpp
class CfgVehicles {
    class ace_csw_baseTripod;
    class banana_tripod: ace_csw_baseTripod {
        class ace_csw { disassembleTo = "banana_carry_tripod"; }; // What will be spawned when "Pickup Tripod" is selected
    };
};
```

### 2.2 CfgWeapons

```cpp
class CfgWeapons {
    class Launcher_Base_F;
    class banana_carry_tripod: Launcher_Base_F {
        class ACE_CSW {
            type = "mount"; // What type of carry it is. Must always be "mount" for the tripod
            deployTime = 4; // How long it takes to deploy the tripod
            pickupTime = 4; // How long it takes to pickup the tripod
            deploy = "banana_tripod"; // what vehicle will spawn when the tripod is deployed
        };
    };
};
```
