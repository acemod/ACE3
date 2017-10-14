/*
 * Author: commy2
 *
 * Returns all lighting hitpoints of any vehicle.
 * Note: These are actual selections that are affected by setHit and getHit, not getHitPointDamage or setHitpointDamage.
 * They behave like having an armor value of 0.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: Light Hitpoints <ARRAY>
 * 1: Selections <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getReflectorsWithSelections
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

private _hitpoints = [];
private _selections = [];

// iterate through all parents
while {isClass _config} do {
    private _class = _config >> "Reflectors";

    for "_i" from 0 to (count _class - 1) do {
        private _entry = _class select _i;
        private _selection = getText (_entry >> "hitpoint");

        if (!(_selection in _selections) && {!isNil {_vehicle getHit _selection}}) then {
            _hitpoints pushBack configName _entry;
            _selections pushBack _selection;
        };
    };

    _config = inheritsFrom _config;
};

[_hitPoints, _selections]
