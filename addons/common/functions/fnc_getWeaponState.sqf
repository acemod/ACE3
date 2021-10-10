#include "script_component.hpp"
/*
 * Author: commy2
 * Return current state of the weapon. Attachments and magazines with ammo.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: weapon (optional, default: units current weapon) <STRING>
 *
 * Return Value:
 * 0: Attachements <ARRAY>
 * 1: Muzzles <ARRAY>
 * 2: Magazines <ARRAY>
 * 3: Ammo <ARRAY>
 *
 * Example:
 * [bob, "gun"] call ace_common_fnc_getWeaponState
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_weapon", nil, [""]]];

if (isNil "_weapon") then {
    _weapon = currentWeapon _unit;
};

private _attachments = [_unit weaponAccessories _weapon] param [0, ["","","",""]];

private _muzzles = _weapon call FUNC(getWeaponMuzzles);

// get loaded magazines and ammo
private _magazines = _muzzles apply {""};
private _ammo = _muzzles apply {0};

{
    if (_x select 2) then {
        private _index = _muzzles find (_x select 4);

        if (_index != -1) then {
            _magazines set [_index, _x select 0];
            _ammo set [_index, _x select 1];
        };
    };
    false
} count magazinesAmmoFull _unit;

[_attachments, _muzzles, _magazines, _ammo];
