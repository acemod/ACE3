/*
 * Author: esteldunedain
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

GVAR(settings) = [];

// Load settings from main config
_countOptions = count (configFile >> "ACE_Settings");
for "_index" from 0 to (_countOptions - 1) do {
    _optionEntry = (configFile >> "ACE_Settings") select _index;

    [_optionEntry] call FUNC(setSettingFromConfig);
};
// Check if all settings should be forced
if (GVAR(forceAllSettings)) then {
    {
        _x set [6, true];
    } forEach GVAR(settings);
};

// @todo
// Load settings from server userconfig only if the ACE_ServerSettings is loaded
/*if (isClass (configFile >> "CfgPatches" >> "ACE_ServerSettings")) then {
    DFUNC(serverUserConfig) = compile preprocessFileLineNumbers "\userconfig\ACE\ACE_Settings.hpp";
    if !(isNil DFUNC(serverUserConfig)) then {
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
};*/

// Load settings from mission config
_countOptions = count (missionConfigFile >> "ACE_Settings");
for "_index" from 0 to (_countOptions - 1) do {
    _optionEntry = (missionConfigFile >> "ACE_Settings") select _index;

    [_optionEntry] call FUNC(setSettingFromConfig);
};
// Check if all settings should be forced
if (GVAR(forceAllSettings)) then {
    {
        _x set [6, true];
    } forEach GVAR(settings);
};

// Publish all settings data
publicVariable QGVAR(settings);
// Publish all setting values
{
    publicVariable (_x select 0);
} forEach GVAR(settings);
