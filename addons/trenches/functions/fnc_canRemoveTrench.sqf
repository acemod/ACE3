#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if a unit can remove a trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Can remove <BOOL>
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_canRemoveTrench
 *
 * Public: No
 */

params ["_trench", "_unit"];

if !("ACE_EntrenchingTool" in (_unit call EFUNC(common,uniqueItems))) exitWith {false};

// Prevent removing/digging trench by more than one person
if (_trench getVariable [QGVAR(digging), false]) exitWith {false};

true
