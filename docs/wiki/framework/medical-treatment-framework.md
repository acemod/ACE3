---
layout: wiki
title: Medical Treatment Framework
description: Explains extending the treatment system for developers.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 2
---

## 1. Config Values

### 1.1 Vehicle Patient Seats

Defines the seats that will be prioritized when loading patients into vehicles. Uses `moveInCargo` indexes.

```cpp
class CfgVehicles {
    class MyCar {
        ace_medical_treatment_patientSeats[] = {3,4};
    };
};
```

### 1.2 Patient Reverse Fill

When no patient seats are available, by default patients will be filled from the highest cargo index to the lowest.
This can be changed to fill from the lowest to the highest.

```cpp
class CfgVehicles {
    class MyCar {
        ace_medical_treatment_patientReverseFill = 0;
    };
};
```
