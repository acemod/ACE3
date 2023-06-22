#include "script_component.hpp"
/*
 * Author: Glowbal, KoffeinFlummi, commy2
 * Check if a unit is any engineer class.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Class <NUMBER> (default: 1)
 *
 * Return Value:
 * Is Engineer Class <BOOL>
 *
 * Example:
 * [unit, 1] call ace_repair_fnc_isEngineer
 *
 * Public: Yes
 */

params ["_unit", ["_engineerN", 1]];

private _class = _unit getVariable ["ACE_IsEngineer", _unit getUnitTrait "engineer"];

// This if statement is here for copmatability with the common variant of isEngineer, which requires a bool.
// We cannot move this function to common because we require the GVAR(engineerSetting_Repair), which only makes sense to include in the repair module.
if (_class isEqualType false) then {_class = [0, 1] select _class};

TRACE_3("isEngineer",_unit,_engineerN,_class);
if (_class >= _engineerN) exitWith {true};
if (!GVAR(locationsBoostTraining)) exitWith {false};

if ([_unit] call FUNC(isInRepairFacility) || {[_unit] call FUNC(isNearRepairVehicle)}) then {
    _class = _class + 1; // Boost engineer training by one: untrained becomes engineer, engineer becomes advanced engineer
};

_class >= _engineerN
