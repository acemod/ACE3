/*
 * Author: commy2
 *
 * Called from respawn eventhandler. Resets all public object namespace variables that are added via FUNC(setVariableJIP).
 *
 * Argument:
 * 0: Object (Object)
 *
 * Return value:
 * Nothing.
 */
#include "\z\ace\addons\common\script_component.hpp"

private ["_unit", "_respawnVariables"];

_unit = _this select 0;

_respawnVariables = _unit getVariable ["ACE_respawnVariables", []];

// yes those
_respawnVariables pushBack "ACE_PersistentFunctions";

{
  _unit setVariable [_x, _unit getVariable _x, true];
} forEach _respawnVariables;

// fix speaker after respawn
[_unit, format ["{_this setSpeaker '%1'}", speaker _unit], 2] call FUNC(execRemoteFnc);
