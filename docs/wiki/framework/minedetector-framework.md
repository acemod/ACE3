---
layout: wiki
title: Mine Detector Framework
description: Explains how to add custom mine detectors, as well as making objects detectable.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 19
  patch: 0
---

## 1. Making objects detectable

Objects defined in `CfgVehicles` or `CfgAmmo` can be detected if their `ace_minedetector_detectable` attribute is set to `1`.


## 2. Adding custom mine detectors

Adding a custom mine detector requires you to create an addon containing specific classes and properties in the config.

### 2.1 Add the item

Create your weapon.

```cpp
class CfgWeapons {
    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };
    class MyMineDetector: Pistol_Base_F {
        displayName = "My Mine Detector";
        model = "path/to/myMineDetectorModel.p3d"
    };
};
```

### 2.2 Add the mine detector config

Add a new config entry in `"ACE_detector" >> "detectors"` with the same name as the weapon created above.

```cpp
class ACE_detector {
    class detectors {
        class MyMineDetector {
            detectorPosition = {1.3, -0.22, 0.4}; // Position from which the mine detector will search for mines (= position of the mine detector head)
            radius = 2.5; // Maximum distance the mine detector can detect a mine
            sounds[] = {"ace_detector_1", "ace_detector_2", "ace_detector_3, "ace_detector_4"}; // Sounds
            soundDistances[] = {0, 0.5, 1.25, 2}; // Distances defining the sounds to be played when a mine is detected
            soundIntervals[] = {0.5, 0.7, 0.85, 1}; // Interval values
            soundIntervalDistances[] = {0, 0.75, 1.25, 2}; // Distances defining at what intervals the sounds should be played
        };
    };
};
```

In the example above, the sound `ace_detector_1` will be played between 0 and 0.5 m, `ace_detector_2` 0.5 - 1.25 m, `ace_detector_3` 1.25 - 2 m and `ace_detector_4` 2 - 2.5 m. All of these numbers are defined in `soundDistances`, except the maximum, which is defined in `radius.` The last distance defined in `soundDistances` must therefore be either equal or smaller than `radius.`.

`soundIntervals` is done is the same manner as `sounds`, except it uses `soundIntervalDistances` instead of `soundDistances`.

`detectorPosition` defines an offset from the selection `"granat"` on a person. The following piece of code allows you visualize the position in game:

```sqf
private _unit = player;
private _detectorType = currentWeapon player;
private _detectorPosition = (_detectorType call ace_minedetector_fnc_getDetectorConfig) select 0;

private _worldPosition = _unit modelToWorld (_unit selectionPosition "granat");                                
private _detectorPointAGL = _worldPosition vectorAdd (([_detectorPosition] matrixMultiply ((_unit weaponDirection _detectorType) call ace_common_fnc_createOrthonormalReference)) select 0);

// Create an arrow at the place where the mine detector head is                      
private _arrow = createVehicle ["Sign_Arrow_Blue_F", _detectorPointAGL, [], 0, "CAN_COLLIDE"];

[{deleteVehicle _this}, _arrow, 2] call CBA_fnc_waitAndExecute;
```
