/*
 * Author: CAA-Picard
 *
 * Reads a boolean value from a module, sets de AGM_Parameter. Logs if parameters are missing in the module.
 *
 * Arguments:
 * 0: Module (Object)
 * 1: AGM_Parameter name (string)
 * 2: Module parameter name (string)
 *
 * Return Value:
 * None
 */

 private ["_logic", "_agmParameterName", "_moduleParameterName"];
 
_logic = _this select 0;
_agmParameterName = _this select 1;
_moduleParameterName = _this select 2;

// Check if the parameter is defined in the module
if (isNil {_logic getVariable _moduleParameterName}) exitWith {
  diag_log text format["[AGM]: Warning in %1 module: %2 parameter is missing. Probably an obsolete version of the module is used in the mission.", typeOf _logic, _moduleParameterName];
};

// Set the parameter
[_agmParameterName , if (_logic getVariable _moduleParameterName) then {1} else {0}] call FUNC(setParameter);
