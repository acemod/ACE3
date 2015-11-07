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
local _paramsArray = missionnamespace getvariable ["paramsArray", []];

TRACE_1("Reading missionConfigFile params",_paramsArray);

{
    local _config = (missionConfigFile >> "params") select _forEachIndex;
    if ((getNumber (_config >> "ACE_setting")) > 0) then {
        local _settingName = configName _config;
        local _settingValue = _x;
        local _force = (getNumber (_config >> "force")) > 0;
        local _title = getText (_config >> "title");

        TRACE_4("ace_setting",_title,_settingName,_settingValue,_force);

        // Check if the variable is already defined
        if (isNil _settingName) exitWith {
            ACE_LOGERROR_1("readSettingsFromParamsArray - param [%1] is not an ace_setting", _settingName);
        };

        local _settingData = [_settingName] call FUNC(getSettingData);
        _settingData params ["", "_typeName", "", "", "", "", "_isForced"];

        // Check if it's already forced and quit
        if (_isForced) exitWith {ACE_LOGWARNING_1("readSettingsFromParamsArray - param [%1] is already set and forced", _settingName);};

        // The setting is not forced, so update the value
        // Read entry and cast it to the correct type from the existing variable
        _validValue = false;
        _value = switch (true) do {
            case (_typeName == "SCALAR"): {_validValue = true;};
            case (_typeName == "BOOL"): {
                _settingValue = _settingValue > 0;
                _validValue = true;
            };
            //TODO: Handle ARRAY,COLOR,STRING??? (bool/scalar covers most important settings)
        };

        if (!_validValue) exitWith {
            ACE_LOGWARNING_3("readSettingsFromParamsArray - param [%1] type not valid [%2] - expected type [%3]", _settingName,_settingValue,_typeName);
        };

        // Update the variable globaly and Force the setting if requested
        [_settingName, _settingValue, _force, true] call FUNC(setSetting);
    };
} foreach _paramsArray;
