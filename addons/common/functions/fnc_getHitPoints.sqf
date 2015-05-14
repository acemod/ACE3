/*
 * Author: commy2
 *
 * Returns all hitpoints of any vehicle. Non unique hitpoints in turrets are ignored.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The hitpoints (Array)
 */
#include "script_component.hpp"

private ["_config", "_hitpoints"];

PARAMS_1(_vehicle);

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

_hitpoints = [];

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
            private "_entry";
            _entry = configName (_class select _i);

            if (!(_entry in _hitpoints) && {!isNil {_vehicle getHitPointDamage _entry}}) then {
                _hitpoints pushBack _entry;
            };
        };

        _class = inheritsFrom _class;
    };

} forEach _hitpointClasses;

_hitpoints
