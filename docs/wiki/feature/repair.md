---
layout: wiki
title: Repair
description: Adds custom repair system.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 3
  patch: 0
---

## 1. Overview

Adds a more realistic repair system.
- Replacing damaged wheels and tracks requires replacement items (using <a href="{{ site.baseurl }}/wiki/framework/cargo-framework.html">ace_cargo</a>.
- Can repair specific hitpoints on vehicles.
- Can designate buildings and/or vehicles as repair zones allowing the ability to do a full repair.

## 2. Repairing

- Vehicle's engine should be off
- A `ToolKit` item may be required based on settings (default: not required for wheels, required for tracks or hitpoint repair)

### 2.1 Replacing Wheels or Tracks

- Unload a spare wheel or track (using cargo interaction)
- Drag the spare next to the wheel/track that needs replacing
- Remove the damaged wheel (not needed for track repair)
- Install new wheel or track

### 2.2 Repairing hitpoints

- Amount repaired is based on settings and training level
- Using the interaction system select the hitpoint to repair

## 3. Object Variables / Configs

### 3.1 Unit's Repair Training

- Determines if a unit can repair damaged hitpoints and if so, how much can be restored.
- Can easily be set via 3den attribute.

SetVar: `"ACE_IsEngineer"` - number 0 - 2 (can also be true/false)
- 0 / false: Untrained (by default settings will only be able to replace wheels)
- 1 / true: Engineer
- 2: Advanced Engineer (allowing a higher level of repairs, based on settings) (by default settings is the only one with access to full repair)

### 3.2 Repair Vehicles

- Allows full repair based on setting `fullRepairLocation` (not enabled by default)
- Can easily be set via 3den attribute.

SetVar: `"ACE_isRepairVehicle"` - true or false

Config: `ace_repair_canRepair` - 0 or 1

### 3.3 Repair Facilities

- Allows full repair based on setting `fullRepairLocation` (on by default)

SetVar: `"ACE_isRepairFacility"` - true or false

## 4. Dependencies

{% include dependencies_list.md component="repair" %}

