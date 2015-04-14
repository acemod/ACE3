/*
 * Author: esteldunedain
 *
 * Count how many grenade magazines the unit has on the uniform and vest.
 *
 * Argument:
 * 0: Muzzle name
 *
 * Return value:
 * 0: Number of magazines
 * 1: First magazine name
 */
#include "script_component.hpp"

private ["_unit", "_muzzle"];

_unit = _this select 0;
_muzzle = _this select 1;

private ["_uniformMags", "_vestMags", "_backPackMags"];

_uniformMags = getMagazineCargo uniformContainer _unit;
_vestMags = getMagazineCargo vestContainer _unit;
_backPackMags = getMagazineCargo backpackContainer _unit;

private ["_numberOfMagazines", "_magazineClasses", "_firstMagazine"];

_numberOfMagazines = 0;
_magazineClasses = getArray (configFile >> "CfgWeapons" >> "Throw" >> _muzzle >> "magazines");
_firstMagazine = _magazineClasses select 0;

{
    private ["_indexInUniform", "_indexInVest", "_indexInBackpack"];

    _indexInUniform = (_uniformMags select 0) find _x;
    if (_indexInUniform > -1) then {
        _numberOfMagazines = _numberOfMagazines + ((_uniformMags select 1) select _indexInUniform);
        _firstMagazine = _x;
    };

    _indexInVest = (_vestMags select 0) find _x;
    if (_indexInVest > -1) then {
        _numberOfMagazines = _numberOfMagazines + ((_vestMags select 1) select _indexInVest);
        _firstMagazine = _x;
    };

    _indexInBackpack = (_backpackMags select 0) find _x;
    if (_indexInBackpack > -1) then {
        _numberOfMagazines = _numberOfMagazines + ((_backpackMags select 1) select _indexInBackpack);
        _firstMagazine = _x;
    };

} forEach _magazineClasses;

[_numberOfMagazines, _firstMagazine]
