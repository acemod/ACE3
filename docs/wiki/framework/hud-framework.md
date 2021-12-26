---
layout: wiki
title: HUD Framework
description: Explains how to use the HUD framework.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 15
  patch: 0
---

## 1. Configs Values

The HUD Framework allows registering controls to be drawn on mission postInit alongside ACE3's HUD elements. Registered HUD elements are automatically hidden when pausing the game or opening interfaces like the Arsenal or Zeus. Conditions can also be defined to show or hide an element when entering or exiting vehicles.

Reference [RscTitles Reference](https://github.com/acemod/ACE3/blob/master/extras/RscTitlesReference.hpp) for examples of how to declare your custom HUD control.

### 1.1 `RscTitles`

Example: Medical Feedback HUD Indicators

```cpp
class RscPictureKeepAspect;
class RscTitles {
    class ACE_RscHUDHelper {
        class controls {
            class GVAR(bloodVolumeIndicator): RscPictureKeepAspect { // Classname is also used as uiNamespace variable name.
                idc = -1; // Recommended. Access control through 'uiNamespace getVariable [QGVAR(bloodVolumeIndicator), controlNull]';
                onLoad = QUOTE(_this call EFUNC(common,registerHUDElement)); //Required. Registers control as a HUD element.
                condition = ""; // Condition for showing HUD element. Can be function, missionNamespace variable, or code. "" = always shown.
                x = IGUI_GRID_STANCE_X; // X position of the control. safeZoneX is the left of the screen.
                y = IGUI_GRID_STANCE_Y; // Y position of the control. safeZoneY is the top of the screen.
                w = IGUI_GRID_STANCE_WAbs / 4; // Width of the control. safeZoneW is the full length of the screen.
                h = IGUI_GRID_STANCE_HAbs / 4; // Height of the control. safeZoneH is the full height of the screen.
                text = ""; // Any other properties work as expected for GUI controls.
            };
            class GVAR(stateIndicator1): GVAR(bloodVolumeIndicator) {
                condition = QUOTE(GVAR(enableHUDIndicators) && {(vehicle ACE_player) == ACE_player}); // Shown only when enabledHUDIndicators = true and current unit is dismounted.
                x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs * 3 / 4;
                w = IGUI_GRID_STANCE_WAbs / 4;
                h = IGUI_GRID_STANCE_HAbs / 4;
            };
            class GVAR(stateIndicator2): GVAR(stateIndicator1) {
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs / 4;
            };
            class GVAR(stateIndicator3): GVAR(stateIndicator1) {
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs * 2 / 4;
            };
        };
    };
};
```

## 2. Removing a HUD Element

As simple as passing the HUD Element to `ace_common_fnc_removeHUDElement`.

### 2.1 fnc_removeHUDElement

`ace_common_fnc_removeHUDElement`

```sqf
/*
 * Argument:
 * 0: Control <CONTROL>
 */
```

### 2.2 Example

```sqf
_ctrl = uiNamespace getVariable ["ace_medical_feedback_bloodVolumeIndicator", controlNull];
[_ctrl] call ace_common_fnc_removeHUDElement;
```
