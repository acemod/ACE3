/*
 * Author: esteldunedain
 *
 * Reads a setting value from a module, set it and force it. Logs if the setting is missing from the module.
 * Must be called on the server, effect is global.
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

if !(isServer) exitWith {};

PARAMS_3(_logic,_settingName,_moduleVariable);

// Check if the parameter is defined in the module
if (isNil {_logic getVariable _moduleVariable}) exitWith {
    ACE_LOGWARNING(format["Warning in %1 module: %2 setting is missing. Probably an obsolete version of the module is used in the mission.", typeOf _logic, _moduleVariable]);
};

// Set the setting globally and force it
[_settingName, _logic getVariable _moduleVariable, true, true] call FUNC(setSetting);
