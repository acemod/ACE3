/*
 * Author: commy2
 *
 * Returns all lighting hitpoints of any vehicle.
 * Note: These are actual selections that are affected by setHit and getHit, not getHitPointDamage or setHitpointDamage.
 * They behave like having an armor value of 0.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The light names and selections (Array)
 */
#include "script_component.hpp"

private ["_config", "_hitpoints", "_selections", "_i"];

params ["_vehicle"];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

_hitpoints = [];
_selections = [];

// iterate through all parents
while {isClass _config} do {
    private "_class";
    _class = _config >> "Reflectors";

    for "_i" from 0 to (count _class - 1) do {
        private ["_entry", "_selection"];

        _entry = _class select _i;
        _selection = getText (_entry >> "hitpoint");

        if (!(_selection in _selections) && {!isNil {_vehicle getHit _selection}}) then {
            _hitpoints pushBack configName _entry;
            _selections pushBack _selection;
        };
    };

    _config = inheritsFrom _config;
};

[_hitPoints, _selections]
