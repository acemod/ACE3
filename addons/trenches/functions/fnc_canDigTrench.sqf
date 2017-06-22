/*
 * Author: Ruthberg, commy2, esteldunedain
 * Checks if a unit can dig a trench.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can dig <BOOL>
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_canDigTrench
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if !("ACE_EntrenchingTool" in items _unit) exitWith {false};

_unit call EFUNC(common,canDig)
