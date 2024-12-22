#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Get current temperature of weapon's ammo.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * Current ammunition temperature <NUMBER>
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_getAmmoTemperature
 *
 * Public: Yes
 */

params ["_unit", "_weapon"];

private _ammoTempVarName = format [QGVAR(%1_ammoTemp), _weapon];

_unit getVariable [_ammoTempVarName, ambientTemperature select 0]
