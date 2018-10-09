#include "script_component.hpp"
/*
 * Author: commy2
 * Handle opening of interaction menu.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_tripod_fnc_handleInteractMenuOpened
 *
 * Public: No
*/

params ["_unit"];

if (_unit getVariable [QGVAR(adjusting), false]) then {
    _unit setVariable [QGVAR(adjusting), false, true];
};
