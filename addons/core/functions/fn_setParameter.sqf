/*
 * Author: CAA-Picard
 *
 * Sets the value of an AGM_Parameter and makes it public.
 *
 * Arguments:
 * 0: Parameter name (string)
 * 1: Value
 *
 * Return Value:
 * None
 */

 private ["_name", "_value"];

_name = _this select 0;
_value = _this select 1;

// Hack to keep backward compatibility for the moment
if ((typeName (missionNamespace getVariable _name)) == "BOOL") then {
  if ((typeName _value) == "SCALAR") then {
    _value = _value > 0;
  };
};

missionNamespace setVariable [_name, _value];
publicVariable _name;
