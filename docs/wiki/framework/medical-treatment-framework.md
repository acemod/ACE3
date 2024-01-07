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
### 1.3 Treatment Items

Items in `CfgWeapons` with `ACE_isMedicalItem` property will be added to the ACE Medical category in the ACE Arsenal.
```cpp
class CfgWeapons {
    class MyMedicalItem {
        ACE_isMedicalItem = 1;
    };
};
```
Required items in `ACE_Medical_Treatment_Actions` will also be added as a fallback.
```cpp
class ACE_Medical_Treatment_Actions {
    class MyCustomTreatment {
        items[] = {"MyMedicalItem"};
    };
};
```

## 2. Mission Variables

### 2.1 Grave Digging Object Configuration

The object created when digging a grave can be modified by setting the `ace_medical_treatment_graveClassname` variable.
```sqf
ace_medical_treatment_graveClassname = "Land_Grave_11_F"; // classname, e.g. unmarked gravel (no headstone OR check actions)
```

The object's rotation can also be modified, if necessary.
```sqf
ace_medical_treatment_graveRotation = 0; // rotation angle (will depend on model classname)
```

### 2.2 Zeus Medical Menu Module

If a mission maker wishes to disable Zeus access to the medical menu, they can set the variable below:
ace_medical_gui_enableZeusModule = false; // default is true
