#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Function for closing doors and retracting the hooks for RHS USF helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_rhs_afrf3_fnc_onCut
 *
 * Public: No
 */
params ["_vehicle"];

_vehicle setVariable [QEGVAR(fastroping,doorsLocked), false, true];
_vehicle animateDoor ["LeftDoor", 0];

2
