#include "..\script_component.hpp"
/*
 * Author: Ruthberg, commy2
 * Checks if the player can deploy a sandbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * player call ace_sandbag_fnc_canDeploy
 *
 * Public: No
 */

params ["_unit"];

([_unit, "ACE_Sandbag_empty"] call EFUNC(common,hasItem)) && {!(_unit getVariable [QGVAR(isUsingSandbag), false])} && {_unit call EFUNC(common,canDig)} // return
