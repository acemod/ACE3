#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles locality switch.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: State <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Injured"] call ace_medical_statemachine_fnc_localityTransfer
 *
 * Public: No
 */

params ["_unit", "_currentState"];
TRACE_2("localityTransfer",_unit,_currentState);

private _oldState = [_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
if (_oldState != _currentState) then {
    TRACE_2("changing state",_oldState,_currentState);
    [_unit, EGVAR(medical,STATE_MACHINE), _oldState, _currentState, {}, "LocalityChange"] call CBA_statemachine_fnc_manualTransition;
};
