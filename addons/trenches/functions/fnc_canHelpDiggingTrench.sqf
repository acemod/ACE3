#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if unit can help digging trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Help Digging Trench <BOOL>
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_canHelpDiggingTrench
 *
 * Public: No
 */

params ["_trench", "_unit"];

if !("ACE_EntrenchingTool" in (_unit call EFUNC(common,uniqueItems))) exitWith {false};
if ((_trench getVariable [QGVAR(progress), 0]) >= 1) exitWith {false};
if !(_trench getVariable [QGVAR(digging), false]) exitWith {false};
if (count (_trench getVariable [QGVAR(diggingPlayers),[]]) < 1) exitWith {false};

true
