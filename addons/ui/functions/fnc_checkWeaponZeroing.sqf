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

private _vehicle = objectParent _unit;
private _currentZero = -1;

if (isNull _vehicle) then {
    _currentZero = currentZeroing _unit;
} else {
    // In Arma3 v2.20 this will return the zero set by vehicle laser rangefinders
    _currentZero = (_vehicle currentZeroing [_vehicle currentWeaponTurret (_vehicle unitTurret _unit), currentMuzzle _unit]) select 0;
};

[
    [LLSTRING(weaponZeroSetTo)],
    [format ["%1 %2", str _currentZero, LLSTRING(meters)]],
    true
] call CBA_fnc_notify;

_currentZero
