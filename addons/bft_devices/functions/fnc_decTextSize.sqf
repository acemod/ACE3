/*
 * Author: Gundy
 *
 * Description:
 *   Decreases text and icon size
 *
 * Arguments:
 *   1: InterfaceID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_decTextSize;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_interfaceID"];

private ["_drawSizeMultiplier"];

_drawSizeMultiplier = [_interfaceID,"drawSizeMultiplier"] call FUNC(getSettings);
_drawSizeMultiplier = [_drawSizeMultiplier - 0.1] call EFUNC(bft_drawing,updateDrawSize);

[_interfaceID,[["drawSizeMultiplier",_drawSizeMultiplier]],false] call FUNC(setSettings);

true