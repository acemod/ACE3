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

## 2. Medical Vehicles and Facilities

### 2.1 Medical Vehicles

To configure a vehicle as a Medical Vehicle by default, set the `attendant` property in the vehicle's config to `1`.
```cpp
class CfgVehicles {
    class MyAmbulance {
        attendant = 1;
    };
};
```
To set a vehicle as a Medical Vehicle mid-mission, set the `ace_medical_isMedicalVehicle` variable globally.
```sqf
// Sets the object behind your cursor to be a medical vehicle
cursorObject setVariable ["ace_medical_isMedicalVehicle", true, true];

// Create an interaction to turn a vehicle into a medical vehicle
private _statement = {_target setVariable ["ace_medical_isMedicalVehicle", true, true]};
private _action = ["TAG_makeMedicalVehicle", "Set as Medical Vehicle", _statement, {!([_target] call ace_medical_treatment_fnc_isMedicalVehicle)}] call ace_interact_menu_fnc_createAction;
[cursorObject, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_createAction;

// Set all vehicles of type "B_Truck_01_transport_F" as medical vehicles
private _classname = "B_Truck_01_transport_F";
private _affectChildClasses = false; // Affect variants of this vehicle
["B_Truck_01_transport_F", "InitPost", {
    params ["_vehicle"];
    if (!local _vehicle) exitWith {};
    _vehicle setVariable ["ace_medical_isMedicalVehicle", true, true];
}, _affectChildClasses, [], true] call CBA_fnc_addClassEventHandler;
```

### 2.2 Medical Facilities

To configure an object as a Medical Facility by default, add a new array containing its classname to the `ace_medical_facilities` class in config root.
```cpp
class CfgVehicles {
    class ThingX;
    class MyMedicalFacility: ThingX {};
    class MyMedicalFacility2_ElectricBoogaloo: MyMedicalFacility {};
};

class ace_medical_facilities {
    TAG_allOfMyFacilities[] = {"MyMedicalFacility", "MyMedicalFacility2_ElectricBoogaloo"};
};
```
To set an object as a Medical Facility mid-mission, set the `ace_medical_isMedicalFacility` variable globally. See above.


Both Medical Facilities and Medical Vehicles can also be created via the Eden Editor's attributes menu.

## 3. Mission Variables

### 3.1 Grave Digging Object Configuration

The object created when digging a grave can be modified by setting the `ace_medical_treatment_graveClassname` variable.
```sqf
ace_medical_treatment_graveClassname = "Land_Grave_11_F"; // classname, e.g. unmarked gravel (no headstone OR check actions)
```

The object's rotation can also be modified, if necessary.
```sqf
ace_medical_treatment_graveRotation = 0; // rotation angle (will depend on model classname)
```

### 3.2 Zeus Medical Menu Module

If a mission maker wishes to disable Zeus access to the medical menu, they can set the variable below:
```sqf
ace_medical_gui_enableZeusModule = false; // default is true
```

### 3.3 SpO2 Configuration

If 3rd party mods want to disable SpO2 being set to a minimum upon successful CPR, they can set the variable below:
```sqf
ace_medical_treatment_setSpO2UponCPRSuccess = false; // default is true
```
