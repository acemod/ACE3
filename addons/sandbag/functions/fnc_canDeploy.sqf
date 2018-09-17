#include "script_component.hpp"
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
 * [ACE_player] call ace_sandbag_fnc_canDeploy
 *
 * Public: No
 */

params ["_unit"];

if !("ACE_Sandbag_empty" in (_unit call EFUNC(common,uniqueItems))) exitWith {false};

_unit call EFUNC(common,canDig)
