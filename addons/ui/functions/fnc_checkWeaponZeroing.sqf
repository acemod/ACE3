#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Display the zeroing of the player's current muzzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Current Zero <NUMBER>
 *
 * Example:
 * [ace_player] call ace_ui_fnc_checkWeaponZeroing
 *
 * Public: No
 */

params ["_unit"];

[
    [LLSTRING(weaponZeroSetTo)],
    [format ["%1 %2", str currentZeroing _unit, LLSTRING(meters)]],
    true
] call CBA_fnc_notify;

_currentZero

