/*
 * Author: esteldunedain
 * Select the next grenade muzzle to throw.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Muzzlename <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentMuzzle player] call ace_weaponselect_fnc_setNextGrenadeMuzzle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_uniformMags", "_vestMags", "_backpackMags", "_i", "_uniformMagsToRemove", "_vestMagsToRemove", "_backpackMagsToRemove", "_firstMagazine", "_throwMuzzleNames"];

params ["_unit", "_muzzle"];

_uniformMags = getMagazineCargo uniformContainer _unit;
_vestMags = getMagazineCargo vestContainer _unit;
_backpackMags = getMagazineCargo backpackContainer _unit;

_uniformMagsToRemove = [];
_vestMagsToRemove = [];
_backpackMagsToRemove = [];

_firstMagazine = "";
_throwMuzzleNames = getArray (configfile >> "CfgWeapons" >> "Throw" >> "muzzles");

// Collect which magazines to remove
{
    private "_muzzleMagazines";
    _muzzleMagazines = getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines" );

    if (_x != _muzzle) then {

        {
            private "_index";
            _index = (_uniformMags select 0) find _x;
            if (_index > -1) then {
                _uniformMagsToRemove = _uniformMagsToRemove + [[_x, (_uniformMags select 1) select _index]];
            };

            _index = (_vestMags select 0) find _x;
            if (_index > -1) then {
                _vestMagsToRemove = _vestMagsToRemove + [[_x, (_vestMags select 1) select _index]];
            };

            _index = (_backpackMags select 0) find _x;
            if (_index > -1) then {
                _backpackMagsToRemove = _backpackMagsToRemove + [[_x, (_backpackMags select 1) select _index]];
            };
        } forEach _muzzleMagazines;

    } else {

        {
            private "_index";
            _index = (_uniformMags select 0) find _x;
            if (_index > -1) then {
                _firstMagazine = _x;
            };

            _index = (_vestMags select 0) find _x;
            if (_index > -1) then {
                _firstMagazine = _x;
            };

            _index = (_backpackMags select 0) find _x;
            if (_index > -1) then {
                _firstMagazine = _x;
            };
        } forEach _muzzleMagazines;

    };
} forEach _throwMuzzleNames;

// Remove all magazines except those we are switching to --> this breaks the selector
{
    for [{_i = 0}, {_i < (_x select 1)}, {_i = _i + 1}] do {
        _unit removeItem (_x select 0);
    };
} forEach _uniformMagsToRemove;

{
    for [{_i = 0}, {_i < (_x select 1)}, {_i = _i + 1}] do {
        _unit removeItem (_x select 0);
    };
} forEach _vestMagsToRemove;

{
    for [{_i = 0}, {_i < (_x select 1)}, {_i = _i + 1}] do {
        _unit removeItem (_x select 0);
    };
} forEach _backpackMagsToRemove;

// Readd magazines
{
    for [{_i = 0}, {_i < (_x select 1)}, {_i = _i + 1}] do {
        _unit addItemToUniform (_x select 0);
    };
} forEach _uniformMagsToRemove;

{
    for [{_i = 0}, {_i < (_x select 1)}, {_i = _i + 1}] do {
        _unit addItemToVest (_x select 0);
    };
} forEach _vestMagsToRemove;

{
    for [{_i = 0}, {_i < (_x select 1)}, {_i = _i + 1}] do {
        _unit addItemToBackpack (_x select 0);
    };
} forEach _backpackMagsToRemove;
