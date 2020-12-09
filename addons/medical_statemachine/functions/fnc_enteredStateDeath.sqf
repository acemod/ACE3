#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Handles a unit reaching the point of death (calls for a status update).
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_enteredStateDeath
 *
 * Public: No
 */

params ["_unit"];
if (isNull _unit) exitWith {};

//IGNORE_PRIVATE_WARNING ["_thisOrigin", "_thisTransition"]; // vars provided by CBA_statemachine
TRACE_3("enteredStateDeath",_this,_thisOrigin,_thisTransition);

private _causeOfDeath = format ["%1:%2", _thisOrigin, _thisTransition];

// could delay a frame here to fix the double killed EH, but we lose it being a "native" kill (scoreboard / rating)
[_unit, _causeOfDeath] call EFUNC(medical_status,setDead);
