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
 * [bob] call ace_trenches_fnc_handleInteractMenuOpened
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isPlacing), false]) then {
    [_unit] call FUNC(placeCancel);
};
