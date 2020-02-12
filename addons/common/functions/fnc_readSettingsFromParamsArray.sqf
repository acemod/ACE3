#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Read settins from paramsArray that have a ACE_setting = 1.
 * Happens before modules but after all other configs (for force priority)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_common_fnc_readSettingsFromParamsArray
 *
 * Public: No
 */

//paramsArray is a normal variable not a command
private _paramsArray = missionnamespace getVariable ["paramsArray", []];

TRACE_1("Reading missionConfigFile params",_paramsArray);

{
    private _config = (missionConfigFile >> "params") select _forEachIndex;
    if ((getNumber (_config >> "ACE_setting")) > 0) then {
        private _settingName = configName _config;
        private _settingValue = _x;
        private _title = getText (_config >> "title");

        TRACE_3("ace_setting",_title,_settingName,_settingValue);

        // Check if the variable is already defined
        if (isNil _settingName) exitWith {
            ERROR_1("readSettingsFromParamsArray - param [%1] is not an ace_setting", _settingName);
        };

        // The setting is not forced, so update the value
        // Read entry and cast it to the correct type from the existing variable
        (cba_settings_default getVariable [_settingName, []]) params ["", "", ["_settingType", ""]];
        private _validValue = false;
        switch (true) do {
            case (_settingType == "LIST");
            case (_settingType == "SCALAR"): {
                _validValue = [_settingName, _settingValue] call CBA_settings_fnc_check;
            };
            case (_settingType == "CHECKBOX"): {
                _settingValue = _settingValue > 0;
                _validValue = [_settingName, _settingValue] call CBA_settings_fnc_check;
            }; 
            // Will not Handle ARRAY,COLOR,STRING??? (bool/scalar covers most important settings)
        };

        if (!_validValue) exitWith {
            WARNING_3("readSettingsFromParamsArray - param [%1] type not valid [%2] - expected type [%3]", _settingName,_settingValue,_settingType);
        };

        if ([_settingName, "mission"] call CBA_settings_fnc_isForced) then {
            WARNING_1("Setting [%1] - Already Forced",_settingName);
        };

        // Set the setting as a mission setting and force it
        private _return = ["CBA_settings_setSettingMission", [_settingName, _settingValue, true]] call CBA_fnc_localEvent;
        TRACE_3("setSettingMission from paramsArray",_settingName,_settingValue,_return);
    };
} forEach _paramsArray;
