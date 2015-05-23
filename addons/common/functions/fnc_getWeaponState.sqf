/*
 * Author: commy2
 *
 * Return current state of the weapon. Attachments and magazines with ammo.
 *
 * Argument:
 * 0: A unit (Object)
 * 1: A weapon (String)
 *
 * Return value:
 * Weapon info, format: [attachments, muzzles, magazines, ammo] (Array)
 */
 #include "script_component.hpp"

PARAMS_2(_unit,_weapon);

private "_muzzles";
_muzzles = [_weapon] call FUNC(getWeaponMuzzles);

private "_weaponInfo";
_weaponInfo = [];

switch (_weapon) do {
    case (primaryWeapon _unit): {
        _weaponInfo pushBack primaryWeaponItems _unit;

    };

    case (secondaryWeapon _unit): {
        _weaponInfo pushBack secondaryWeaponItems _unit;

    };

    case (handgunWeapon _unit): {
        _weaponInfo pushBack handgunItems _unit;

    };

    default {
        _weaponInfo pushBack ["","","",""];

    };
};

// get loaded magazines and ammo
private ["_magazines", "_ammo"];

_magazines = [];
_ammo = [];

{
    _magazines pushBack "";
    _ammo pushBack 0;
} forEach _muzzles;

{
    if (_x select 2) then {
        private "_index";
        _index = _muzzles find (_x select 4);

        if (_index != -1) then {
            _magazines set [_index, _x select 0];
            _ammo set [_index, _x select 1];
        };
    };
} forEach magazinesAmmoFull _unit;

_weaponInfo append [_muzzles, _magazines, _ammo]; 

_weaponInfo
