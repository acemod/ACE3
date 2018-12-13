#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if a unit can continue digging a trench
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can continue <BOOL>
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_canContinueDiggingTrench
 *
 * Public: No
 */

params ["_trench", "_unit"];

if !("ACE_EntrenchingTool" in (_unit call EFUNC(common,uniqueItems))) exitWith {false};
if ((_trench getVariable [QGVAR(progress), 0]) >= 1) exitWith {false};

// Prevent removing/digging trench while it is beeing changed
if (_trench getVariable [QGVAR(digging), false]) exitWith {false};

true
