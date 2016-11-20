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
#include "script_component.hpp"

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

        private _settingData = [_settingName] call FUNC(getSettingData);
        _settingData params ["", "_typeName", "", "", "", "", "_isForced"];

        // Check if it's already forced and quit
        if (_isForced) exitWith {WARNING_1("readSettingsFromParamsArray - param [%1] is already set and forced", _settingName);};

        // The setting is not forced, so update the value
        // Read entry and cast it to the correct type from the existing variable
        private _validValue = false;
        switch (true) do {
            case (_typeName == "SCALAR"): {_validValue = true;};
            case (_typeName == "BOOL"): {
                _settingValue = _settingValue > 0;
                _validValue = true;
            };
            //TODO: Handle ARRAY,COLOR,STRING??? (bool/scalar covers most important settings)
        };

        if (!_validValue) exitWith {
            WARNING_3("readSettingsFromParamsArray - param [%1] type not valid [%2] - expected type [%3]", _settingName,_settingValue,_typeName);
        };

        // Update the variable globaly and Force
        [_settingName, _settingValue, true, true] call FUNC(setSetting);
    };
} forEach _paramsArray;
