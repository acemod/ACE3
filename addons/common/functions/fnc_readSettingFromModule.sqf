/*
 * Author: esteldunedain
 * Reads a setting value from a module, set it and force it. Logs if the setting is missing from the module.
 * Must be called on all machines!!!!!!!
 *
 * Arguments:
 * 0: Module <OBJECT>
 * 1: ACE_Parameter name <STRING>
 * 2: Module parameter name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MODULE, "Param", "paramname"] call ace_common_fnc_readSettingFromModule
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_logic", "_settingName", "_moduleVariable"];

// Check if the variable is already defined
if (isNil _settingName) exitWith {
    ERROR_1("readSettingFromModule - param [%1] is not an ace_setting", _settingName);
};

// Check if the parameter is defined in the module
if (isNil {_logic getVariable _moduleVariable}) exitWith {
    WARNING_2("Warning in %1 module: %2 setting is missing. Probably an obsolete version of the module is used in the mission.",typeOf _logic,_moduleVariable);
};

private _value = _logic getVariable _moduleVariable;
if (_value isEqualTo -1) then {
    //3den missions will save modules with value = 0 as -1
    //If the setting has a "values" array, we should be able to assume that -1 is not a valid number as it would not be a valid index for the array
    if (isArray (configFile >> "ACE_Settings" >> _settingName >> "values")) then {
        WARNING_2("Module For Setting [%1] is saved as (-1), switching to (0) - missionVersion [%2]",_settingName,missionVersion);
        _value = 0;
    };
};

if ([_settingName, "mission"] call CBA_settings_fnc_isForced) then {
    WARNING_1("Setting [%1] - Already Forced",_settingName);
};

// Set the setting as a mission setting and force it
TRACE_2("setSettingMission from module",_settingName,_value);
["CBA_settings_setSettingMission", [_settingName, _value, true]] call CBA_fnc_localEvent;
