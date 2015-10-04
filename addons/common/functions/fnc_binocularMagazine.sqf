/*
 * Author: commy2
 * Returns the magazine of the units rangefinder.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Magazine of the units binocular <STRING>
 *
 * Example:
 * [player] call ace_common_fnc_binocularMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

private ["_binocular", "_muzzle", "_mode", "_magazine"];

_binocular = binocular _unit;

if (_binocular == "") exitWith {""};

_muzzle = currentMuzzle _unit;
_mode = currentWeaponMode _unit;

_unit selectWeapon _binocular;

_magazine = currentMagazine _unit;

[_unit, _muzzle, _mode] call FUNC(selectWeaponMode);

_magazine
