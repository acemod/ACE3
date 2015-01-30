/*
 * Author: CAA-Picard
 * Load the parameters on the server.
 * Config < Server UserConfig < Mission Config
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(settingsList) = [];

// Load settings from main config
_countOptions = count (configFile >> "ACE_Settings");
for "_index" from 0 to (_countOptions - 1) do {
    _optionEntry = (configFile >> "ACE_Settings") select _index;

    _name = configName _optionEntry;
    _valueEntry = _optionEntry >> "value";
    _typeEntry = _optionEntry >> "typeName";

    [_name, _valueEntry, _typeEntry] call FUNC(setSettingFromConfig);
};
// Check if all settings should be forced
if (GVAR(forceAllSettings)) then {
    {
        if !(missionNamespace getVariable format ["%1_forced", _x]) then {
            missionNamespace setVariable format ["%1_forced", _x, true];
            publicVariable format ["%1_forced", _name];
        };
    } forEach GVAR(settingsList);
};


// Load settings from server userconfig
DFUNC(common,serverUserConfig) = compile preprocessFileLineNumbers "\userconfig\ACE\ACE_Settings.hpp";
if !(isNil QFUNC(common,serverUserConfig)) then {
    [] call FUNC(serverUserConfig);
};
// Check if all settings should be forced
if (GVAR(forceAllSettings)) then {
    {
        if !(missionNamespace getVariable format ["%1_forced", _x]) then {
            missionNamespace setVariable format ["%1_forced", _x, true];
            publicVariable format ["%1_forced", _name];
        };
    } forEach GVAR(settingsList);
};


// Load settings from mission config
_countOptions = count (missionConfigFile >> "ACE_Settings");
for "_index" from 0 to (_countOptions - 1) do {
    _optionEntry = (missionConfigFile >> "ACE_Settings") select _index;

    _name = configName _optionEntry;
    _valueEntry = _optionEntry >> "value";

    [_name, _valueEntry] call FUNC(setSettingFromConfig);
};
// Check if all settings should be forced
if (GVAR(forceAllSettings)) then {
    {
        if !(missionNamespace getVariable format ["%1_forced", _x]) then {
            missionNamespace setVariable format ["%1_forced", _x, true];
            publicVariable format ["%1_forced", _name];
        };
    } forEach GVAR(settingsList);
};