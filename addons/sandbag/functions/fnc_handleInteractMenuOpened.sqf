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
 * [bob] call ace_sandbag_fnc_handleInteractMenuOpened
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isDeploying), false]) then {
    [_unit] call FUNC(deployCancel);
};
