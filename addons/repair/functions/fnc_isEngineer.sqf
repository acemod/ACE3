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
#include "script_component.hpp"

params ["_unit", ["_engineerN", 1]];
TRACE_2("params",_unit,_engineerN);

private ["_class"];
_class = _unit getVariable ["ACE_IsEngineer", _unit getUnitTrait "engineer"];

// This if statement is here for copmatability with the common variant of isEngineer, which requires a bool.
// We cannot move this function to common because we require the GVAR(engineerSetting_Repair), which only makes sense to include in the repair module.
if (_class isEqualType false) then {_class = [0, 1] select _class};

_class >= _engineerN;
