/*
 * Author: commy2
 * Called from respawn eventhandler. Resets all public object namespace variables that are added via FUNC(setVariableJIP).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_restoreVariablesJIP
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _respawnVariables = _unit getVariable ["ACE_respawnVariables", []];

// yes those
_respawnVariables pushBack "ACE_PersistentFunctions";

{
    _unit setVariable [_x, _unit getVariable _x, true];
    false
} count _respawnVariables;
nil
