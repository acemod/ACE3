#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles a unit entering cardiac arrest (calls for a status update).
 * Sets required variables for countdown timer until death.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_enteredStateCardiacArrest
 *
 * Public: No
 */

params ["_unit"];

// 10% possible variance in cardiac arrest time
private _time = GVAR(cardiacArrestTime);
_time = _time + _time * random [-0.1, 0, 0.1];

_unit setVariable [QGVAR(cardiacArrestTimeLeft), _time];
_unit setVariable [QGVAR(cardiacArrestTimeLastUpdate), CBA_missionTime];

TRACE_3("enteredStateCardiacArrest",_unit,_time,CBA_missionTime);

// Update the unit status to reflect cardiac arrest
[_unit, true] call EFUNC(medical_status,setCardiacArrestState);
