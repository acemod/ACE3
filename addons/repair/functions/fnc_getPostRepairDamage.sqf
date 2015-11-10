/*
 * Author: commy2
 * Returns the damage threshold based on settings and unit type.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 *
 * Return Value:
 * 0: Rpair Damage Threshold <NUMBER>
 *
 * Example:
 * [unit] call ace_repair_fnc_getPostRepairDamage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);
// TODO when near repair station, full repair?

if (([_unit] call FUNC(isInRepairFacility) || {[_unit] call FUNC(isNearRepairVehicle)})) exitWith {0};

if ([_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold_Engineer)};
if ([_unit, GVAR(engineerSetting_Repair)] call FUNC(isEngineer)) exitWith {GVAR(repairDamageThreshold)};
0.3;
