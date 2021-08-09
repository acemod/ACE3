---
layout: wiki
title: Medical Framework
description: Contains useful ACE Medical scripting information for mission makers.
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 7
  patch: 0
---

# 1. Scripting

### 1.1 `Adding Damage to a Unit (Oct 2019)`

To add damage to a unit, use the function `ace_medical_fnc_addDamageToUnit`

Arguments:
* 0: The Unit - OBJECT
* 1: Damage to Add - NUMBER
* 2: Body part ("Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg") - STRING
* 3: Projectile Type - STRING
* 4: Source - OBJECT
* 5: Non-directional damage source array (Optional) - ARRAY

List of Projectile Types:

* backblast
* bullet
* collision
* drowning
* explosive
* falling
* grenade
* punch
* ropeburn
* shell
* stab
* unknown
* vehiclecrash

Examples

```sqf
[_unit, 0.5, "LeftArm", "bullet", objNull, []] call ACE_medical_fnc_addDamageToUnit;
```

### 1.2 `Changing Pain Level`

To adjust pain values for a unit, use the function `ace_medical_fnc_adjustPainLevel`

Arguments:
* 0: The Unit - OBJECT
* 1: Added amount of pain (can be negative) - NUMBER

Examples

```sqf
[_unit, 0.5] call ace_medical_fnc_adjustPainLevel;
```

### 1.3 `Setting Unit Unconscious State`

To change whether a unit is conscious or unconsious, use the function `ace_medical_fnc_setUnconscious`

Arguments:
* 0: The Unit - OBJECT
* 1: Set Unconscious - BOOL
* 2: Minimum Unconscious Time - NUMBER (default: 0)
* 3: Force Wakeup At Given Time - BOOL (default: false)
	
Examples

```sqf
[_unit, true, 60, true] call ace_medical_fnc_setUnconscious;
```
