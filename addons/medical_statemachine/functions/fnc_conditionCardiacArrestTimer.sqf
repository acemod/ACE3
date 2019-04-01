#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the cardiac arrest timer ran out.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_conditionCardiacArrestTimer
 *
 * Public: No
 */

params ["_unit"];

private _startTime = _unit getVariable [QGVAR(cardiacArrestStart), CBA_missionTime];
private _lifeTime = _unit getVariable [QGVAR(cardiacArrestTime), GVAR(cardiacArrestTime)];

(CBA_missionTime - _startTime) > _lifeTime
