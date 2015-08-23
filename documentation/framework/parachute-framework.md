---
layout: wiki
title: Parachute framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Adding a reserve parachute to an existing parachute

```c++
class CfgVehicles {

    class banana_parachute;  // your parachute base class

    class banana_parachute_02: banana_parachute {  // your parachute class
        ace_hasReserveParachute = 1;  // 1 = enabled, 0 = disabled
        ace_reserveParachute = "ACE_ReserveParachute";  // classname of the reserve parachute
    };
};
```
