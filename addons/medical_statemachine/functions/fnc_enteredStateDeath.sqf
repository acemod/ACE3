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

TRACE_4("enteredStateDeath",_this,_thisOrigin,_thisTransition,_thisTarget);

// WIP:
// Delay and only trigger EH once
// But lose native kill (scoreboard / rating)

// [{ // Delay a frame to ensure that we are not killing the unit while still inside the handleDamage code block
    [_this, _thisOrigin, _thisTransition] call {
    params ["_unit", "_state", "_transition"];
    if (isNull _unit) exitWith {};

    private _causeOfDeath = format ["%1:%2",_state,_transition];
    TRACE_2("calling setDead",_unit,_causeOfDeath);

    [_unit, _causeOfDeath] call EFUNC(medical_status,setDead);
    };
// }, [_this, _thisOrigin, _thisTransition]] call CBA_fnc_execNextFrame;
