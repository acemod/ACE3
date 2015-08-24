/*
 * Author: Dslyecxi, MikeMatrix
 * Initializes Settings for the groups modules and transcodes settings to a useable format.
 *
 * Arguments:
 * 0: Logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [module, [player], true] call ace_map_gestures_fnc_moduleGroupSettings
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!_activated || !isServer) exitWith {};

// Transcode string setting into usable array. Example: "1,1,1,1" -> [1, 1, 1, 1]
_leadColor = call compile ("[" + (_logic getVariable ["leadColor", ""]) + "]");
if (!([_leadColor] call FUNC(isValidColorArray))) exitWith {ERROR("leadColor is not a valid color array.")};
_color = call compile ("[" + (_logic getVariable ["color", ""]) + "]");
if (!([_color] call FUNC(isValidColorArray))) exitWith {ERROR("color is not a valid color array.")};

// If we already have color configurations from another source, use those, otherwise use default.
_configurations = if (isNil QGVAR(GroupColorConfigurations)) then { [] } else { +GVAR(GroupColorConfigurations) };
_configurationGroupMappings = if(isNil QGVAR(GroupColorConfigurationMapping)) then { HASH_CREATE } else { +GVAR(GroupColorConfigurationMapping) };

// Save custom color configuration and keep the index of the entry.
_configurationIndex = _configurations pushBack [_leadColor, _color];

// Add all synchronized groups and reference custom configuration for them
{
    HASH_SET(_configurationGroupMappings,groupID (group _x),_configurationIndex);
} count _units;

[QGVAR(GroupColorConfigurations), _configurations, false, true] call EFUNC(common,setSetting);
[QGVAR(GroupColorConfigurationMapping), _configurationGroupMappings, false, true] call EFUNC(common,setSetting);
