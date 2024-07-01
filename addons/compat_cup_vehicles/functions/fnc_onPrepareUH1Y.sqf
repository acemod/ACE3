#include "..\script_component.hpp"
/*
 * Author: Unknown
 * Function for extending the hook for the CUP UH-1Y Helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before deploying ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_cup_vehicles_fnc_onPrepareUH1Y
 *
 * Public: No
 */

params ["_vehicle"];

_vehicle setVariable ["ace_fastroping_doorsLocked", true, true];
_vehicle animateSource ["fries_extend", 1];

2
