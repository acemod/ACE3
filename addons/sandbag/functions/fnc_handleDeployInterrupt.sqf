#include "..\script_component.hpp"
/*
 * Author: commy2
 * Handles various interruption types.
 *
 * Arguments:
 * 0: (New) unit <OBJECT>
 * 1: Old unit (for player change) <OBJECT> (default: objNull)
 * 2: Ignore item check <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sandbag_fnc_handleDeployInterrupt
 *
 * Public: No
*/

params ["_newPlayer", ["_oldPlayer", objNull], ["_ignoreItemCheck", true]];
TRACE_3("params",_newPlayer,_oldPlayer,_ignoreItemCheck);

if (_ignoreItemCheck || {!([_newPlayer, "ACE_Sandbag_empty"] call EFUNC(common,hasItem))}) then {
    _newPlayer call FUNC(deployCancel);
};

if (!isNull _oldPlayer) then {
    _oldPlayer call FUNC(deployCancel);
};
