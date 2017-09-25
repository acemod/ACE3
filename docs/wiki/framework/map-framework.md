---
layout: wiki
title: Map Framework
description: Explains the Map system for developers.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 11
  patch: 0
---

## 1. Config Values

### 1.1 Vehicle Interior Lighting

```cpp
class CfgVehicles {
    class MyCar {
        // Sets color of light projected onto player's map
        ace_map_vehicleLightColor[] = {0,1,0,0.1}; 
        
         // Lists turret indexes that are outside of the vehicle and would not recieve interior lighting (e.g. riding on top of a tank)
        ace_map_vehicleExteriorTurrets[] = {12,13};
        
         // Condition for interior lights to be working (string that when compiled and call should return a bool, will be passed _vehicle)
        ace_map_vehicleLightCondition[] = "(_vehicle animationSourcePhase 'cabinlights_hide') == 1";
    };
};
```
