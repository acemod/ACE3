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
#include "\z\ace\addons\core\script_component.hpp"

private ["_unit", "_name"];

_unit = _this select 0;

if (isNull _unit || {!alive _unit}) exitWith {};

if (_unit isKindOf "CAManBase") then {
  _name = [name _unit, true] call FUNC(sanitizeString);

  //if (_name != _unit getVariable ["ACE_Name", ""]) then {
    _unit setVariable ["ACE_Name", _name, true];
  //};
};
