/*
 * Author: commy2
 *
 * Returns all hitpoints and their selections of any vehicle. Might contain duplicates if the turrets contain non unique hitpoints with different selection names.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The hitpoints with selections. Format: [hitpoints, selections]. They correspond by index. (Array)
 */
#include "script_component.hpp"

private ["_config", "_hitpoints", "_selections", "_i"];

params ["_vehicle"];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

_hitpoints = [];
_selections = [];

// get all classes that can contain hitpoints
private "_hitpointClasses";
_hitpointClasses = [_config >> "HitPoints"];
{
    private "_class";
    _class = ([_config, _x] call FUNC(getTurretConfigPath)) >> "HitPoints";

    if (isClass _class) then {
        _hitpointClasses pushBack _class;
    };

} forEach allTurrets _vehicle;

// iterate through all classes with hitpoints and their parents
{
    private "_class";
    _class = _x;

    while {isClass _class} do {

        for "_i" from 0 to (count _class - 1) do {
            private ["_entry", "_selection"];

            _entry = configName (_class select _i);
            _selection = getText (_class select _i >> "name");

            if (!(_selection in _selections) && {!isNil {_vehicle getHit _selection}}) then {
                _hitpoints pushBack _entry;
                _selections pushBack _selection;
            };
        };

        _class = inheritsFrom _class;
    };

} forEach _hitpointClasses;

[_hitpoints, _selections]
