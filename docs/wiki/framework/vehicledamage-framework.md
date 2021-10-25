---
layout: wiki
title: Vehicle Damage Framework
description: Explains how to configure vehicles to simulate vehicle damage.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---

## 1. CfgVehicles

### 1.1 Config Values

The only configuration needed for vehicles are their probabilities to cook-off/detonate upon being penetrated.
These values are dice-rolls within system, tweak to get better feeling effects.

All values in range [0, 1] unless specified otherwise

#### 1.1.1 `ace_vehicle_damage_hullDetonationProb`

The probability for the vehicle to detonate ammunition upon its hull being penetrated

Default: 0.2

#### 1.1.2 `ace_vehicle_damage_turretDetonationProb`

The probability for the vehicle to detonate ammunition upon its turret being penetrated

Default: 0.2

#### 1.1.3 `ace_vehicle_damage_engineDetonationProb`

The probability for the vehicle to detonate ammunition upon its turret being penetrated

Default: 0.2

#### 1.1.4 `ace_vehicle_damage_hullFireProb`

The probability for the vehicle to catch on fire upon its hull being penetrated

Default: 0.5

#### 1.1.5 `ace_vehicle_damage_turretFireProb`

The probabilitiy for the vehicle to catch on fire upon its turret being penetrated

Default: 0.2

#### 1.1.6 `ace_vehicle_damage_engineFireProb`

The probability for the vehicle to catch on fire upon its engine being penetrated

Default: 0.5

#### 1.1.7 `ace_vehicle_damage_detonationDuringFireProb`

The probabilitiy for the vehicle to detonate ammunition while its on fire

Default: 0.2

#### 1.1.8 `ace_vehicle_damage_canHaveFireRing`

Whether or not this vehicle can spawn `ring-of-fire` effect (Boolean value: 0 or 1)

Default: 0

#### 1.1.9 `ace_vehicle_damage_slatHitpoints`

An array of all hitpoints that are defined to be SLAT. String array

Default: {}

#### 1.1.10 `ace_vehicle_damage_eraHitpoints`

An array of all hitpoints that are defined to be ERA. String array

Default: {}

#### 1.1.11 `ace_vehicle_damage_turret`

String for turret classname to spawn when catastrophically destroyed. Turret will pop-off and this is the class spawned

Default: ""

### 1.2 Defined Hitpoints

#### 1.2.1 Default assumed hitpoints

- Engine: `hitengine`
- Hull: `hithull`, `hitbody`, `#structural`
- Tracks: `hitltrack`, `hitrtrack`
- Wheels: `hitlbwheel`, `hitlmwheel`, `hitlfwheel`, `hitlf2wheel`, `hitrbwheel`, `hitrmwheel`, `hitrlwheel`, `hitrfwheel`, `hitrf2wheel`
- Fuel: `hitfuel`

#### 1.2.2 Turret, Gun, ERA, and SLAT hitpoints

On vehicle placement the system will iterate through all hitpoints define in `class Turrets` and find the relevant weapons and add their hitpoints. This occurs for ERA and SLAT as well

## CfgAmmo

The only configuration needed on ammo is the warhead type (if applicable) and the incendiary value

### 1.1 `ace_vehicle_damage_incendiary`

Value in range [0, 1] for how incendiary the ammo is. This is used in calculations to ignite fires. Not based on any real-world value, tweak as feels right.

#### 1.1.1 Default Values

- Tandem/HEAT: 1
- AP: 0.1
- HE: 0.3
- Incendiary Bullet: 0.7

### 1.2 `warheadName`

Default ARMA config value. We assume that the warheads are vanilla strings, so options are

- `HE`
- `AP`
- `HEAT`
- `TandemHEAT`

If no `ace_vehicle_damage_incendiary` defined, this value will be used to assume a default based on above table of common values (excluding `Incendiary Bullet` which is 0).
