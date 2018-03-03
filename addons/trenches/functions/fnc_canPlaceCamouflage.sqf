/*
 * Author: chris579
 * Checks if camouflage can be applied to a trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 *
 * Return Value:
 * Can place <BOOL>
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_canPlaceCamouflage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_trench", "_unit"];

if (!GVAR(allowCamouflage)) exitWith {false};

if (GVAR(camouflageRequireEntrenchmentTool) && {!("ACE_EntrenchingTool" in items _unit)}) exitWith {false};

(count (_trench getVariable [QGVAR(camouflageObjects), []]) == 0) &&
{count (getArray (configFile >> "CfgWorlds" >> worldName >> QGVAR(camouflageObjects))) > 0} &&
{count (configProperties [configFile >> "CfgVehicles" >> (typeof _trench) >> QGVAR(camouflagePositions)]) > 0}
