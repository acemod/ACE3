/*
 * Author: commy2
 *
 * The player will select the specified weapon and change to the first additional muzzle. E.g. the grenade launcher of a assault rifle.
 *
 * Arguments:
 * 0: Unit (Object)
 * 1: A weapon (String)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

PARAMS_2(_unit,_weapon);

if (_weapon == "") exitWith {};

private "_muzzles";
_muzzles = [_weapon] call EFUNC(common,getWeaponMuzzles);

if (currentWeapon _unit != _weapon) exitWith {
    if (count _muzzles > 1) then {

        // unlock safety
        /*if (_weapon in (_unit getVariable [QEGVAR(safemode,safedWeapons), []])) exitWith {
            [_unit, _weapon, _muzzles select 1] call EFUNC(safemode,unlockSafety);
        };*/

        _unit selectWeapon (_muzzles select 1);
    };
};

private ["_index", "_muzzle"];

_index = (_muzzles find currentMuzzle _unit) + 1;
if (_index > count _muzzles - 1) then {_index = 1};

_muzzle = _muzzles select _index;

_index = 0;
while {
    _index < 100 && {currentMuzzle _unit != _muzzle}
} do {
    _unit action ["SwitchWeapon", _unit, _unit, _index];
    _index = _index + 1;
};
