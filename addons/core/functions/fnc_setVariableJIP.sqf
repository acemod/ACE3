/*
 * Author: commy2
 *
 * Sets a public object namespace variable that gets reset with the same value after respawn, so JIP clients keep the value.
 *
 * Argument:
 * 0: Object (Object)
 * 1: Variable name (String)
 * 2: Any value (Anything)
 *
 * Return value:
 * Nothing.
 */

private ["_unit", "_varName", "_value", "_respawnVariables"];

_unit = _this select 0;
_varName = _this select 1;
_value = _this select 2;

_respawnVariables = _unit getVariable ["AGM_respawnVariables", []];

if !(_varName in _respawnVariables) then {
  _respawnVariables pushBack _varName;
  _unit setVariable ["AGM_respawnVariables", _respawnVariables, true];
};

_unit setVariable [_varName, _value, true];
