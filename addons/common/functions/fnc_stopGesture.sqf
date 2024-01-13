#include "..\script_component.hpp"
/*
 * Author: ACRE2Team
 * Stops a unit's gesture.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_stopGesture
 *
 * Public: Yes
 */

params ["_unit"];

[QGVAR(playActionNow), [_unit, QGVAR(stop)], _unit] call CBA_fnc_targetEvent
