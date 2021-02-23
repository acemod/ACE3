#include "script_component.hpp"
/*
 * Author: mharis001
 * Checks if the given unit can repack magazines of the given type.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine <STRING>
 *
 * Return Value:
 * Can Repack Magazine <BOOL>
 *
 * Example:
 * [_unit, _magazine] call ace_magazinerepack_fnc_canRepackMagazine
 *
 * Public: No
 */

params ["_unit", "_magazine"];

private _maxAmmoCount = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

{
    _x params ["_magazineType", "_ammoCount", "_isLoaded"];

    _magazineType == _magazine // Magazine is of given type
    && {_ammoCount > 0 && {_ammoCount < _maxAmmoCount}} // Is a partial magazine
    && {!_isLoaded || {_unit canAdd _magazineType}} // In inventory or can be moved into it
} count magazinesAmmoFull _unit > 1
