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
  minor: ?
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
		class ace_csw_cswOptions {
			disassembleTo = "banana_carry_weapon"; // What will be spawned when "Disassemble Weapon" is pressed
		};
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				weapons[] = {"banana_weapon"}; // Whatever custom weapon is being used
				magazines[] = {"banana_dummy_ammo"}; // The dummy ammo is the max-ammo used by the weapon.
			};
		};
		class ACE_Actions: ACE_Actions {
			class ACE_MainActions: ACE_MainActions {
				displayName = "Banana Weapon";
			};
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
	};
	class banana_dummy_ammo: 100Rnd_127x99_mag {
		scope=1; // Just to make sure it doesn't show up in Arsenal
		type=0; // This has to be zero so it doesnt show in Arsenal
		count = 1234; // Max ammo used by the static weapon
	};
};
```

### 1.3 CfgWeapons

```cpp
class CfgWeapons {
	class ace_csw_base_carry;
	class banana_carry_weapon: ace_csw_base_carry {
		class ace_csw_cswOptions {
			assembleTo = "banana_csw"; // What the weapon will assemble into
			baseTripod = "banana_tripod"; // The tripod which the weapon can be assembled onto (Default is "ace_csw_m3Tripod")
			type = "weapon"; // What type of carry it is. Must always be "weapon" for the carry weapon
		};
	};
	
	class HMG_Static;
	class banana_weapon: HMG_Static {
		class ace_csw_cswOptions {
			deployTime = 10; // Time in seconds it takes to mount the weapon on the tripod
			pickupTime = 12; // Time in seconds it takes to dismount the weapon from the tripod
			ammoLoadTime = 7; // Time in seconds it takes to load the relavent ammo into the weapon
			ammoUnloadTime = 16; // Time in seconds it takes to unload the relavent ammo from the weapon
		};
		magazines[] = { banana_ammo, banana_dummy_ammo }; // You must have both the dummy and real ammunition
	};
};
```

## 2. Making a new Tripod

### 2.1 CfgVehicles

```cpp
class CfgVehicles {
	class ace_csw_baseTripod;
	class banana_tripod: ace_csw_baseTripod {
		class GVAR(cswOptions) { disassembleTo = "banana_carry_tripod"; };
	};
};
```

### 2.2 CfgWeapons

```cpp
class CfgWeapons {
	class ace_csw_base_carry;
	class banana_carry_tripod: ace_csw_base_carry {
		class GVAR(cswOptions) {
				deployTime = 166;
				pickupTime = 12;
				type = "mount";
				deploy = "banana_tripod";
			};
	};
};
```