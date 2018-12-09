---
layout: wiki
title: HOT
description: HOT 1/2/3 Missiles
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Overview

### 1.1 Guidance

HOT missile is a wire-guided SACLOS weapon. It requires the shooter to provide constant aiming in order to hit its target.

### 1.2 Attack profiles

The missile requires line of sight to the target at all times. Keep your crosshair on the target as the missile cruises toward it until impact.
If you lose line of sight the missile will stop tracking toward your crosshair and will fly on its current trajectory. You can regain control if the missile re-enters line of sight.
If the missile exceeds its maximum range the wire will snap and it will fly off in a random direction.

### 1.3 Missile Types

There are 4 HOT missiles included
- HOT 1: Able to penetrate around 800mm RHA. Max range is 4000 meters. HEAT
- HOT 2: Able to penetrate around 900mm RHA. Max range is 4000 meters. HEAT
- HOT 2MP: Anti-Infantry. Contains 1000 steel balls that scatter on impact. Also contains a chemical incendiary device which has a kill radius of around 20 meters. Able to penetrate around 350mm RHA. Max range is 4000 meters. HE
- HOT 3: Able to penetrate around 1250mm RHA. Max range is 4300 meters. Tandem HEAT

## 2. Usage

- Select the HOT launcher and aim toward your target. Once you fire the weapon you must keep your crosshair on the target until impact. Note: The HOT missile sits 0.5 meters above the crosshair
- If the missile exceeds 4000 meters (4300 meters for the HOT 3) the wire will snap and you will lose control over the missile.
- If the missile is 30 degrees outside of your current crosshair position the seeker will not be able to find the missile and you will lose control over it.

## 3 Adding to vehicles

- Easiest way to add is via the 1.70 Pylons system.
- HOT missiles can also be added to other vehicles via config or script.

### 3.1 Classnames

- Weapons: `ace_hot_1_launcher`, `2_launcher`, `ace_hot_2mp_launcher`, `ace_hot_3_launcher`, `ace_hot_generic_launcher`
- Magazines: `ace_hot_1_6Rnd`, `ace_hot_1_2Rnd`, `ace_hot_2_6Rnd`, `ace_hot_2_2Rnd`, `ace_hot_2mp_6Rnd`, `ace_hot_2mp_2Rnd`, `ace_hot_3_6Rnd`, `ace_hot_3_2Rnd`
- Pylon Magazines: `ace_hot_1_PylonMissile_1Rnd`, `ace_hot_1_PylonRack_1Rnd`, `ace_hot_1_PylonRack_3Rnd`, `ace_hot_1_PylonRack_4Rnd`, `ace_hot_2_PylonMissile_1Rnd`, `ace_hot_2_PylonRack_1Rnd`, `ace_hot_2_PylonRack_3Rnd`, `ace_hot_2_PylonRack_4Rnd`, `ace_hot_2mp_PylonMissile_1Rnd`, `ace_hot_2mp_PylonRack_1Rnd`, `ace_hot_2mp_PylonRack_3Rnd`, `ace_hot_2mp_PylonRack_4Rnd`, `ace_hot_3_PylonMissile_1Rnd`, `ace_hot_3_PylonRack_1Rnd`, `ace_hot_3_PylonRack_3Rnd`, `ace_hot_3_PylonRack_4Rnd`

### 3.2 Script Example

- Adding HOT to e.g. a Cessna Civilian Plane:

```cpp
if (local this) then {
    this addWeaponTurret ["ace_hot_generic_launcher", [-1]];
    this addMagazineTurret ["ace_hot_2mp_6Rnd", [-1]];
    this addMagazineTurret ["ace_hot_3_6Rnd", [-1]];
};
```

## 4. Dependencies

{% include dependencies_list.md component="hot" %}
