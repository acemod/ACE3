#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Saves the currently select gun profile into the profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_save_gun
 *
 * Public: No
 */

private _index = 0 max (lbCurSel 6000);

GVAR(gunList) set [_index, +GVAR(workingMemory)];

lbClear 6000;
{
    lbAdd [6000, _x select 0];
} forEach GVAR(gunList);

call FUNC(store_gun_list);
