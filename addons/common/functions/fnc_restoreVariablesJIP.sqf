/*
 * Author: commy2
 *
 * Called from respawn eventhandler. Resets all public object namespace variables that are added via FUNC(setVariableJIP).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private "_respawnVariables";

params ["_unit"];

_respawnVariables = _unit getVariable ["ACE_respawnVariables", []];

// yes those
_respawnVariables pushBack "ACE_PersistentFunctions";

{
    _unit setVariable [_x, _unit getVariable _x, true];
    true
} count _respawnVariables;
