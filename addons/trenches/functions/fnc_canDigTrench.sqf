#include "script_component.hpp"
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

params ["_unit"];

if !(_unit call FUNC(hasEntrenchingTool)) exitWith {false};

_unit call EFUNC(common,canDig)
