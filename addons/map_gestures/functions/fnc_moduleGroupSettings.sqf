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

if (!_activated) exitWith {};
if (!isServer) exitWith {};

_leadColor = call compile ("[" + (_logic getVariable ["leadColor", ""]) + "]");
if (isNil "_leadColor" || !((typeName _leadColor) isEqualTo "ARRAY") || {count _leadColor != 4}) exitWith {};
_color = call compile ("[" + (_logic getVariable ["color", ""]) + "]");
if (isNil "_color" || !((typeName _color) isEqualTo "ARRAY") || {count _color != 4}) exitWith {};

_configurationGroups = if (isNil QGVAR(GroupColorConfigurationsGroups) then { [] } else { +GVAR(GroupColorConfigurationsGroups) };

if (isNil "_configurationGroups") then {_configurationGroups = [];};
if (isNil "_configurationGroupsIndex") then {_configurationGroupsIndex = [];};
_completedGroups = [];
{
    private "_group";
    _group = groupID (group _x);
    if (!(_group in _completedGroups)) then {
        _index = if (_group in _configurationGroups) then {_configurationGroups find _group} else {_configurationGroups pushBack _group};
        _configurationGroupsIndex set [_index, _configurationIndex];
        _completedGroups pushBack _group;
    };
    nil
} count _units;

[QGVAR(GroupColorConfigurations), _configurations, true, true] call EFUNC(common,setSetting);
[QGVAR(GroupColorConfigurationsGroups), _configurationGroups, true, true] call EFUNC(common,setSetting);
[QGVAR(GroupColorConfigurationsGroupIndex), _configurationGroupsIndex, true, true] call EFUNC(common,setSetting);
