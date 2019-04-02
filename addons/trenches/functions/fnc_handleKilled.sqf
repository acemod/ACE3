#include "script_component.hpp"
/*
 * Author: commy2
 * Handle death.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_trenches_fnc_handleKilled
 *
 * Public: No
*/

params ["_unit"];

if (_unit getVariable [QGVAR(isPlacing), false]) then {
    [_unit] call FUNC(placeCancel);
};
