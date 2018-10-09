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
 * [bob] call ace_sandbag_fnc_handleKilled
 *
 * Public: No
*/

params ["_unit"];

if (_unit getVariable [QGVAR(isDeploying), false]) then {
    [_unit] call FUNC(deployCancel);
};
