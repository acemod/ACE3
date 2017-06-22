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
#include "script_component.hpp"

params ["_unit"];

if !("ACE_Sandbag_empty" in items _unit) exitWith {false};

_unit call EFUNC(common,canDig)
