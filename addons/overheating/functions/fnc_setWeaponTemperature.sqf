#include "script_component.hpp"
/*
 * Author: drofseh
 * Set weapon to specific temperature.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Temperature <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_setWeaponTemperature
 *
 * Public: Yes
 */

params ["_unit", "_weapon", "_temp"];

private _ammoTempVarName = format [QGVAR(%1_ammoTemp), _weapon];

_unit setVariable [_ammoTempVarName, _temp];
