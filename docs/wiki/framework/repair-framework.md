---
layout: wiki
title: Repair Framework
description: Explains how to set-up repair system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 3
  patch: 0
---

## 1. Object Variables / Configs

### 1.1 Unit's Repair Training

- Determines if a unit can repair damaged hitpoints and if so, how much can be restored.
- Can easily be set via 3den attribute.

SetVar: `"ACE_IsEngineer"` - number 0 - 2 (can also be true/false)
- 0 / false: Untrained (by default settings will only be able to replace wheels)
- 1 / true: Engineer
- 2: Advanced Engineer (allowing a higher level of repairs, based on settings) (by default settings is the only one with access to full repair)

### 1.2 Repair Vehicles

- Allows full repair based on setting `fullRepairLocation` (not enabled by default)
- Can easily be set via 3den attribute.

SetVar: `"ACE_isRepairVehicle"` - true or false

Config: `ace_repair_canRepair` - 0 or 1

### 1.3 Repair Facilities

- Allows full repair based on setting `fullRepairLocation` (on by default)

SetVar: `"ACE_isRepairFacility"` - true or false
