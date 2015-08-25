---
layout: wiki
title: Parachute Framework
description: Explains how to set-up a parachute with ACE3 parachute system.
group: framework
order: 5
parent: wiki
---

## 1. Adding reserve parachute to existing parachute

```c++
class CfgVehicles {
    class BananaParachute {
        ace_hasReserveParachute = 1;  // Add reserve parachute (1-enabled, 0-disabled)
        ace_reserveParachute = "ACE_ReserveParachute";  // Classname of the reserve parachute
    };
};
```
