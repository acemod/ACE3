#include "script_component.hpp"
/*
 * Author: Cyruz
 * Checks if a unit can camouflage a trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can camouflage <BOOL>
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_canCamouflageTrench
 *
 * Public: No
 */

params ["_trench", "_unit"];

if !(_unit call FUNC(hasEntrenchingTool)) exitWith {false};

// Prevent camouflage if not fully dug
if ((_trench getVariable [QGVAR(progress), 0]) != 1) exitWith {false};

// Prevent camouflage being applied once already camouflaged
if (_trench getVariable [QGVAR(camouflaged), false]) exitWith {false};

true
