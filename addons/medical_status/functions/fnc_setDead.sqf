#include "script_component.hpp"
/*
 * Author: commy2
 * Kills a local unit.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Reason for death <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", ["_reason", "#setDead"]];
TRACE_2("setDead",_unit,_reason);

// No heart rate or blood pressure to measure when dead
_unit setVariable [VAR_HEART_RATE, 0, true];
_unit setVariable [VAR_BLOOD_PRESS, [0, 0], true];

_unit setVariable [QEGVAR(medical,causeOfDeath), _reason, true];

// Send a local event before death
[QEGVAR(medical,death), [_unit]] call CBA_fnc_localEvent;

// Kill the unit without changing visual apperance
[_unit, 1] call EFUNC(medical_engine,setStructuralDamage);
