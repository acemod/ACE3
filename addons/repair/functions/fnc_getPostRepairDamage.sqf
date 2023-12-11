#include "..\script_component.hpp"
/*
 * Author: commy2
 * Returns the damage threshold based on settings and unit type.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Override for full repair <BOOL> (default: false)
 *
 * Return Value:
 * 0: Repair Damage Threshold <NUMBER>
 *
 * Example:
 * [unit] call ace_repair_fnc_getPostRepairDamage
 *
 * Public: No
 */

params ["_unit", ["_override", false]];
TRACE_2("params",_unit,_override);

//If in facility, near vehicle, or doing full repair then complete repair of hitpoint:
if ((_override || {[_unit] call FUNC(isInRepairFacility)} || {[_unit] call FUNC(isNearRepairVehicle)})) exitWith {0};

private _class = _unit getVariable ["ACE_IsEngineer", getNumber (configOf _unit >> "engineer")];
//If advanced or more qualified than min, then use engineer threshold:
if ((_class isEqualTo 2) || {[_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)}) exitWith {
    (GVAR(repairDamageThreshold_Engineer) min GVAR(repairDamageThreshold))
};

//Return default threshold:
GVAR(repairDamageThreshold)
