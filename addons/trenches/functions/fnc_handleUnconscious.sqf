/*
 * Author: commy2
 * Handle unconsciousness.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_trenches_fnc_handleUnconscious
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isPlacing), false]) then {
    [_unit] call FUNC(placeCancel);
};
