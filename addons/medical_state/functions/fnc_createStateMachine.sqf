#include "script_component.hpp"

params ["_stateMachineConfig"];

private _getCode = {
    params ["_config", "_attribute"];
    private _value = getText (_config >> _attribute);
    if (_value == "") {_value = "true"};
    compile _value;
};

private _states = [];
{
    private _stateName = configName _x;
    private _onState = [_x, "onState"] call _getCode;
    private _onEntry = [_x, "onEntry"] call _getCode;
    private _onExit = [_x, "onExit"] call _getCode;

    // Collect all the transitions for the state
    private _transitions = [];
    {
        private _transitionName = configName _x;
        private _targetState = getText (_x >> "targetState");
        private _events = getArray (_x >> "events");
        private _condition = [_x, "condition"] call _getCode;
        private _onTransition = [_x, "onTransition"] call _getCode;

        _transitions pushBack [_transitionName, _condition, _events, _onTransition, _targetState];
    } forEach ("true" configClasses _x);
    _states pushBack [_stateName, _onState, _onEntry, _onExit, _transitions];
} forEach ("true" configClasses _stateMachineConfig);

// Helper method for finding the desired state when linking (See below)
private _getState = {
    params ["_stateName"];
    private _state = ["Invalid", {}, {}, {}, []];
    {
        if (_stateName == (_x select 0)) exitWith {_state = _x};
    } forEach _states;
    _state;
};

// Now we have collected all the states, link them in transitions so we do not have to look them up on state transitions
{
    _x params ["", "", "", "", "_transitions"];
    {
        _x params ["", "", "", "", "_targetState"];
        private _state = [_targetState] call _getState;
        _x set [4, _state];
    } forEach _transitions;
} forEach _states;

_states;
