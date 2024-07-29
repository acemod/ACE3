#include "..\script_component.hpp"
/*
 * Author: Unknown
 * Function for retracting the hooks for CUP UH-1Y helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_cup_vehicles_fnc_onCutUH1Y
 *
 * Public: No
 */
params ["_vehicle"];

_vehicle setVariable ["ace_fastroping_doorsLocked", false, true];
_vehicle animateSource ["fries_extend", 0];

2
