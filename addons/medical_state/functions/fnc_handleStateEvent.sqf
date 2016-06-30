
#include "script_component.hpp"

params ["_unit", "_event", "_args"];

private _unitState = _unit getvariable [QGVAR(state), [CBA_missionTime, DEFAULT_STATE]];
_unitState params ["_lastTime", "_state"];
_state params ["_name", "_handler", "_onEntry", "_onExit", "_transitions"];

{
   _x params ["_transitionName", "_condition", "_events", "_onTransition", "_targetState"];

   if (_condition && {_event in _events}) exitWith {
       _targetState params ["_targetStateName", "_targetStateHandler", "_targetStateOnEntry", "_targetStateOnExit", "_targetStateTansitions"];

       // Handle state leaving
       [_unit, _event, _args] call {
           params ["_unit", "_event", "_args"];
           [_unit, _event, _args] call _onExit;
           [_unit, _event, _args] call _onTransition;
       };

       // Switch the state
       _unitState set [1, _targetState];
       _unit setvariable [QGVAR(state), _unitState];

       // Enter the state
       [_unit, _event, _args] call {
           params ["_unit", "_event", "_args"];
           [_unit, _event, _args] call _targetStateOnEntry;
       };
   };
} forEach _transitions;
