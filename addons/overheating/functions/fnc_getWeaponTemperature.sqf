#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Get current temperature of weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * Current ammunition temperature <NUMBER>
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_getWeaponTemperature
 *
 * Public: Yes
 */

params ["_unit", "_weapon"];

private _weaponTempVarName = format [QGVAR(%1_temp), _weapon];

_unit getVariable [_weaponTempVarName, ambientTemperature select 0];
