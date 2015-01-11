/*
 * Author: commy2
 *
 * Returns the name of the object. Used to prevent issues with the name command.
 *
 * Argument:
 * 0: Object (Object)
 * 1: Show effective commander name? (Bool, optinal default: false)
 *
 * Return value:
 * The name.
 */

private ["_unit", "_showEffective", "_name"];

_unit = _this select 0;
_showEffective = _this select 1;

if (isNil "_showEffective") then {
  _showEffective = false;
};

_name = "";

if (_unit isKindOf "CAManBase") then {
  _name = _unit getVariable ["AGM_Name", localize "STR_GVAR(Unknown)"];
} else {
  if (_showEffective) then {
    _name = [effectiveCommander _unit] call GVAR(fnc_getName);
  } else {
    _name = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
  };
};

_name
