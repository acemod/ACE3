#include "..\script_component.hpp"
/*
 * Author: commy2, Smith
 * Handle various interruption types.
 *
 * Arguments:
 * 0: (New) unit <OBJECT>
 * 1: Old unit (for player change) <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_cargo_fnc_handleDeployInterrupt
 *
 * Public: No
*/

params ["_newPlayer", ["_oldPlayer", objNull]];
TRACE_2("params",_newPlayer,_oldPlayer);

if (!local _newPlayer) exitWith {};

if (_newPlayer getVariable [QGVAR(isDeploying), false]) then {
    _newPlayer call FUNC(deployCancel);
};

if (_oldPlayer getVariable [QGVAR(isDeploying), false]) then {
    _oldPlayer call FUNC(deployCancel);
};
