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
 * Public: No
 */
#include "script_component.hpp"
params ["_unit"];

private _startTime = _unit getVariable [QGVAR(cardiacArrestStart), CBA_missionTime];
private _lifeTime = _unit getVariable [QGVAR(cardiacArrestTime), GVAR(cardiacArrestTime)];

(CBA_missionTime - _startTime) > _lifeTime
