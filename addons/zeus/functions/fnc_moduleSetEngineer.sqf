/*
 * Author: mharis001
 * Zeus module function to set unit engineer skill.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Skill level (1 - Engineer, 2 - Adv. Engineer) <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, 2] call ace_zeus_fnc_moduleSetEngineer
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", ["_engineerN", 1]];

if (isNull _unit) exitWith {
    ERROR("Passed unit is null");
};

if !([_unit, _engineerN] call EFUNC(repair,isEngineer)) then {
    _unit setVariable ["ACE_IsEngineer", _engineerN, true];
};
