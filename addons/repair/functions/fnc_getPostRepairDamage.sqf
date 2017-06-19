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

//If in facility or near vehicle then complete repair of hitpoint:
if (([_unit] call FUNC(isInRepairFacility) || {[_unit] call FUNC(isNearRepairVehicle)})) exitWith {0};

private _class = _unit getVariable ["ACE_IsEngineer", getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer")];
//If advanced or more qualified than min, then use engineer threshold:
if ((_class isEqualTo 2) || {[_unit, GVAR(engineerSetting_Repair) + 1] call FUNC(isEngineer)}) exitWith {
    (GVAR(repairDamageThreshold_Engineer) min GVAR(repairDamageThreshold))
};

//Return default threshold:
GVAR(repairDamageThreshold)
