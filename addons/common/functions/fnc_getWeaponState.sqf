/*
 * Author: commy2
 * Return current state of the weapon. Attachments and magazines with ammo.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: weapon <STRING>
 *
 * Return Value:
 * 0: Attachements <ARRAY>
 * 1: Muzzles <ARRAY>
 * 2: Magazines <ARRAY>
 * 3: Ammo <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_weapon"];

private ["_muzzles", "_weaponInfo"];

_muzzles = [_weapon] call FUNC(getWeaponMuzzles);

_weaponInfo = [["","","",""], primaryWeaponItems _unit, secondaryWeaponItems _unit, handgunItems _unit] select ((["", primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] find _weapon) max 0);

// get loaded magazines and ammo
private ["_magazines", "_ammo"];

_magazines = [];
_ammo = [];

{
    _magazines pushBack "";
    _ammo pushBack 0;
    false
} count _muzzles;

{
    if (_x select 2) then {
        private "_index";
        _index = _muzzles find (_x select 4);

        if (_index != -1) then {
            _magazines set [_index, _x select 0];
            _ammo set [_index, _x select 1];
        };
    };
    false
} count magazinesAmmoFull _unit;

_weaponInfo append [_muzzles, _magazines, _ammo]; 

_weaponInfo
