/*
 * Author: Salbei
 * Check if unit can help digging trench.
 *
 * Arguments:
 * 0: trench <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_canHelpDiggingTrench
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_trench", "_unit"];

if !("ACE_EntrenchingTool" in (_unit call EFUNC(common,uniqueItems))) exitWith {false};
if ((_trench getVariable [QGVAR(progress), 0]) >= 1) exitWith {false};
if !(_trench getVariable [QGVAR(digging), false]) exitWith {false};
if ((_trench getVariable [QGVAR(diggerCount), 0]) < 1) exitWith {false};

true
