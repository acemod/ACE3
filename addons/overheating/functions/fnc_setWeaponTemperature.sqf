#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Set weapon to specific temperature.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Temperature <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player, 123] call ace_overheating_fnc_setWeaponTemperature
 *
 * Public: Yes
 */

params ["_unit", "_weapon", "_temp"];

private _weaponTempVarName = format [QGVAR(%1_temp), _weapon];

_unit setVariable [_weaponTempVarName, _temp];
