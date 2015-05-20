---
layout: wiki
title: Advanced Vehicle Damage
description: Vehicle damage in ACE3 provides a revolutionary experience and functionality providing direct model access from SQF for addon makers to customize their damage models to extreme detail.
group: framework
order: 5
parent: wiki
---

## 1. Overview


## 2. Call Structure



## 3. Data and Types

### ACE Hit Events

All hit events are structured as an array of [selectionName, damageData]. For example:

hit_thermal event - [ ["magazine001", [0.5, 2000, 3.0]], ["crew02", [0.3, 577, 1]] ]

#### ace_vehicledamage_hit_kenetic
[keneticEnergy, surfaceArea] 
surfaceArea - 0.0 - 1.0 of selection

#### ace_vehicledamage_hit_thermal
[initialTempterature, finalTemperature, varianceSpeed, surfaceArea] 
surfaceArea - 0.0 - 1.0 of selection

#### ace_vehicledamage_hit_pressure
[initialPressure, finalPressure, varianceSpeed, waveSpeed, surfaceArea] 
surfaceArea - 0.0 - 1.0 of selection

#### ace_vehicledamage_hit_material
[deconstruction, surfaceArea] 
deconstruction - 0.0 - 1.0 amount of physical deconstruction of selection
surfaceArea - 0.0 - 1.0 of selection


## 4. Mod Maker Usage


