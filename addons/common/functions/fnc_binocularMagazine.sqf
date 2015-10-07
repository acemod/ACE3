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
 *
 * Note: Doesn't work on dead units
 */
#include "script_component.hpp"

params ["_unit"];

private ["_binocular", "_muzzle", "_mode", "_magazine"];

_binocular = binocular _unit;

if (_binocular == "") exitWith {""};

_muzzle = currentMuzzle _unit;
_mode = currentWeaponMode _unit;

_unit selectWeapon _binocular;

// didn't select the binocular (unit probably dead or not local). function won't work. quit with empty string
if (currentWeapon _unit != _binocular) exitWith {""};

_magazine = currentMagazine _unit;

[_unit, _muzzle, _mode] call FUNC(selectWeaponMode);

_magazine
