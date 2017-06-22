/*
 * Author: Ruthberg
 * Deletes the currently selected gun profile from the profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_delete_gun
 *
 * Public: No
 */
#include "script_component.hpp"

private _index = lbCurSel 6000;

if (_index == -1) exitWith {};

if (GVAR(currentGun) > _index) then {
    GVAR(currentGun) = GVAR(currentGun) - 1;
};

GVAR(gunList) set [_index, 0];
GVAR(gunList) = GVAR(gunList) - [0];

lbDelete [6000, _index];

call FUNC(store_gun_list);
