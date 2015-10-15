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
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isDeploying), false]) then {
    [_unit] call FUNC(deployCancel);
};
