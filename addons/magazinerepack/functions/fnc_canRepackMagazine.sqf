#include "..\script_component.hpp"
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

// Exit if repack is disabled for this magazine.
if (getNumber (configFile >> "CfgMagazines" >> _magazine >> "ace_disableRepacking") == 1) exitWith {false};

private _maxAmmoCount = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

{
    _x params ["_magazineType", "_ammoCount", "_isLoaded"];

    _magazineType == _magazine // Magazine is of given type
    && {_ammoCount > 0 && {_ammoCount < _maxAmmoCount}} // Is a partial magazine
    && {!_isLoaded || {GVAR(repackLoadedMagazines) && {_unit canAdd [_magazineType, 1, true]}}} // In inventory or can be moved into it
} count magazinesAmmoFull _unit > 1
