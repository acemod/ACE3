/*
 * Author: Glowbal
 * Enabled the vitals loop for a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_medical_fnc_addVitalLoop
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", ["_force", false]];

if !([_unit] call FUNC(hasMedicalEnabled) || _force) exitWith {};

if !(local _unit) exitWith {
    [QGVAR(addVitalLoop), [_unit, _force], _unit] call CBA_fnc_targetEvent;
};

// Quit if the unit already has a vital loop, or is dead, unless it's forced
if ((_unit getVariable[QGVAR(addedToUnitLoop),false] || !alive _unit) && !_force) exitWith{};

// Schedule the loop to be executed again 1 sec later
// @todo: should the loop be started righ away instead?
_unit setVariable [QGVAR(addedToUnitLoop), true, true];
[DFUNC(vitalLoop), [_unit, CBA_missionTime], 1] call CBA_fnc_waitAndExecute;
