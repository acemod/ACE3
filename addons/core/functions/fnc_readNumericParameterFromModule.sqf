/*
 * Author: CAA-Picard
 *
 * Reads a numeric value from a module, sets de ACE_Parameter. Logs if parameters are missing in the module.
 *
 * Arguments:
 * 0: Module (Object)
 * 1: ACE_Parameter name (string)
 * 2: Module parameter name (string)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

 private ["_logic", "_parameterName", "_moduleParameterName", "_value"];

_logic = _this select 0;
_parameterName = _this select 1;
_moduleParameterName = _this select 2;

// Check if the parameter is defined in the module
if (isNil {_logic getVariable _moduleParameterName}) exitWith {
  diag_log text format["[ACE]: Warning in %1 module: %2 parameter is missing. Probably an obsolete version of the module is used in the mission.", typeOf _logic, _moduleParameterName]
};

// Check if the value is defined as string for backward compatibility
_value = _logic getVariable _moduleParameterName;
if (typeName _value == "STRING") then {
  _value = parseNumber _value;
};

// Set the parameter
[_parameterName, _value] call FUNC(setParameter);
