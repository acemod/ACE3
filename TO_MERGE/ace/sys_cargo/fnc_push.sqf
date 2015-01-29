/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_target);
_volume = [_target] call FUNC(volume);
_weight = [_target,_volume] call FUNC(weight);

_push_direction = getDir player;

_acceleration = 0.02 * _weight;

_vel = velocity _target;
_pos = getPos _target;

TRACE_5("",_volume,_weight,_push_direction,_acceleration,_vel);

_new_vel = [(_vel select 0)+(sin _push_direction*_acceleration),(_vel select 1)+(cos _push_direction*_acceleration),_vel select 2];
TRACE_1("",_new_vel);

if (_target isKindOf "Static") then {
	_new_pos = [(_pos select 0)+(sin _push_direction*(_acceleration/2)),(_pos select 1)+(cos _push_direction*(_acceleration/2)),_pos select 2];
	_target setPos _new_pos;
	_target setPosATL _new_pos;
} else {
	[QGVAR(setvel), [_target,_new_vel]] call ACE_fnc_receiverOnlyEvent;
};
_target spawn {
	_target = _this;
	sleep 4;
	[QGVAR(setvel), [_target,[0,0,0]]] call ACE_fnc_receiverOnlyEvent;
	//_pos = getPos _target;
	//_target setPos _pos;
};
