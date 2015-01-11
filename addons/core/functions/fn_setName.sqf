/*
 * Author: commy2
 *
 * Sets the name variable of the object. Used to prevent issues with the name command.
 *
 * Argument:
 * 0: Object (Object)
 *
 * Return value:
 * Nothing.
 */

private ["_unit", "_name"];

_unit = _this select 0;

if (isNull _unit || {!alive _unit}) exitWith {};

if (_unit isKindOf "CAManBase") then {
  _name = [name _unit, true] call GVAR(fnc_sanitizeString);

  //if (_name != _unit getVariable ["AGM_Name", ""]) then {
    _unit setVariable ["AGM_Name", _name, true];
  //};
};
