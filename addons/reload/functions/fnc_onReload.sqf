/*
 * Author: BaerMitUmlaut
 * Handles the ammo display on reload and adds empty magazines.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 * 3: New magazine info <ARRAY>
 * 4: Old magazine info <ARRAY>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_unit", "_weapon", "_muzzle", "_newMagInfo", ["_oldMagInfo", ["", -1]]];
_oldMagInfo params ["_oldMagClassname", "_oldMagAmmo"];

if (_unit == ACE_player) then {
    if (GVAR(DisplayText)) then {
        [_unit] call FUNC(displayAmmo);
    };

    if (_oldMagAmmo == 0 && {_unit canAdd _oldMagClassname} && {_weapon != secondaryWeapon _unit}) then {
        _unit addMagazine [_oldMagClassname, 0];
    };
};
