/*
 * Author: commy2
 *
 * Returns the selected Grenade Muzzle.
 *
 * Argument:
 * None
 *
 * Return value:
 * Class name of selected throw muzzle. <STRING>
 */
#include "script_component.hpp"

[GVAR(CurrentGrenadeMuzzleOther), GVAR(CurrentGrenadeMuzzleFrag)] select GVAR(CurrentGrenadeMuzzleIsFrag)
