/*
 * Author: SzwedzikPL
 * Checks if a unit can continue digging a trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Can continue <BOOL>
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_canContinueDiggingTrench
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_trench", "_unit"];

if !("ACE_EntrenchingTool" in items _unit) exitWith {false};
if ((_trench getVariable [QGVAR(progress), 0]) >= 1) exitWith {false};

// Prevent removing/digging trench by more than one person
if (_trench getVariable [QGVAR(digging), false]) exitWith {false};

true
