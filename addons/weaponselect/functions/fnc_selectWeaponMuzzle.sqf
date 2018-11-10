#include "script_component.hpp"
/*
 * Author: commy2
 * The player will select the specified weapon and change to the first additional muzzle. E.g. the grenade launcher of a assault rifle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_weaponselect_fnc_selectWeaponMuzzle
 *
 * Public: No
 */

params ["_unit", "_weapon"];

if (_weapon == "") exitWith {};

private _muzzles = _weapon call EFUNC(common,getWeaponMuzzles);

if (currentWeapon _unit != _weapon) exitWith {
    if (count _muzzles > 1) then {

        // unlock safety
        /*if (_weapon in (_unit getVariable [QEGVAR(safemode,safedWeapons), []])) exitWith {
            [_unit, _weapon, _muzzles select 1] call EFUNC(safemode,unlockSafety);
        };*/

        _unit selectWeapon (_muzzles select 1);
    };
};

private _index = (_muzzles find currentMuzzle _unit) + 1;

if (_index > count _muzzles - 1) then {_index = 1};

private _muzzle = _muzzles select _index;

_index = 0;
while {
    _index < 299 && {currentMuzzle _unit != _muzzle}
} do {
    _unit action ["SwitchWeapon", _unit, _unit, _index];
    _index = _index + 1;
};
