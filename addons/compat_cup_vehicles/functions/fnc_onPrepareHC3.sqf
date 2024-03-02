#include "..\script_component.hpp"
/*
 * Author: Unknown
 * Function for opening doors and extending the hook for HC3 helos.
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

_vehicle animateSource ["Winchsection", 1];
_vehicle animateSource ["Winchsection2", 1];
_vehicle animateDoor ["dvere_p", 0];

2
