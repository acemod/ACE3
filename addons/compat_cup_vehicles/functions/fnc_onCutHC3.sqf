#include "..\script_component.hpp"
/*
 * Author: Unknown
 * Function for retracting the hooks for CUP HC3 helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_cup_vehicles_fnc_onCutHC3
 *
 * Public: No
 */

params ["_vehicle"];

_vehicle setVariable ["ace_fastroping_doorsLocked", false, true];

_vehicle animateSource ["Winchsection", 0];
_vehicle animateSource ["Winchsection2", 0];
_vehicle animateDoor ["dvere_p", 1];

2
