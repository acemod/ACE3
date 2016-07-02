/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Event name <STRING>
 * 2: Event Arguments
 *
 * ReturnValue:
 * Name of the state after handling the state event <STRING>
 *
 * Example:
 * [unit, "TakenInjury", []] call ace_medical_stateEvent;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_event", "_args"];
diag_log format["ace_medical_stateEvent: %1", _this];

_event = toLower _event;

private _unitState = _unit getvariable [QGVAR(state), [CBA_missionTime, GVAR(STATE_MACHINE) getVariable "Default"]];
_unitState params ["_lastTime", "_state"];
_state params ["_name", "_handler", "_onEntry", "_onExit", "_transitions"];

private _newStateName = _name;
{
    _x params ["_transitionName", "_condition", "_events", "_onTransition", "_targetStateName"];
    
    if (_event in _events && {[_unit, _event, _args] call _condition}) exitWith {
        private _targetState = GVAR(STATE_MACHINE) getVariable _targetStateName;

        _targetState params ["_targetStateName", "_targetStateHandler", "_targetStateOnEntry", "_targetStateOnExit", "_targetStateTansitions"];
        _newStateName = _targetStateName;
        // Handle state leaving
        [_unit, _event, _args] call _onExit;
        [_unit, _event, _args] call _onTransition;

        // Switch the state
        _unitState set [1, _targetState];
        _unit setvariable [QGVAR(state), _unitState];

        // Enter the state
        [_unit, _event, _args] call _targetStateOnEntry;
    };
} forEach _transitions;

_newStateName;
