/*
 * Author: commy2
 * Returns the selected Grenade Muzzle.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Class name of selected throw muzzle <STRING>
 *
 * Example:
 * [] call ace_weaponselect_fnc_getSelectedGrenade
 *
 * Public: No
 */
#include "script_component.hpp"

[GVAR(CurrentGrenadeMuzzleOther), GVAR(CurrentGrenadeMuzzleFrag)] select GVAR(CurrentGrenadeMuzzleIsFrag)
