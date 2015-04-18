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
 * Public: No
 */
#include "script_component.hpp"

private ["_name", "_isClientSetable", "_isForced", "_profileValue"];

// Iterate through settings
{
    _name = _x select 0;
    _isClientSetable = _x select 2;
    _isForced = _x select 6;

    // If setting is user setable
    if (_isClientSetable) then {
        // If setting is not forced
        if !(_isForced) then {
            _profileValue = profileNamespace getvariable _name;
            // If the setting is stored on the profile
            if !(isNil "_profileValue") then {
                // If the profile variable has the correct type
                if (typeName _profileValue == typeName (missionNamespace getvariable _name)) then {
                    // Load the setting from the profile
                    missionNamespace setvariable [_name, _profileValue];
                };
            };
        };
    };

} forEach GVAR(settings);
