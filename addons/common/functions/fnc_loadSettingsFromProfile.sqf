/*
 * Author: esteldunedain
 * Load the user setable settings from the user profile.
 * Config < Server UserConfig < Mission Config < Client settings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_loadSettingsFromProfile
 *
 * Public: No
 */
#include "script_component.hpp"

// Iterate through settings
{
    _x params ["_name", "", "_isClientSetable", "", "", "", "_isForced"];

    // If setting is user setable
    if (_isClientSetable) then {
        // If setting is not forced
        if !(_isForced) then {
            private _profileValue = profileNamespace getVariable _name;

            // If the setting is stored on the profile
            if !(isNil "_profileValue") then {
                // If the profile variable has the correct type
                if (_profileValue isEqualType (missionNamespace getVariable _name)) then {
                    // Load the setting from the profile
                    missionNamespace setVariable [_name, _profileValue];
                };
            };
        };
    };
    false
} count GVAR(settings);
