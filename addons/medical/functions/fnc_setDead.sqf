/*
 * Author: Glowbal
 * Either kills a unit or puts the unit in a revivable state, depending on the settings.
 *
 * Arguments:
 * 0: The unit that will be killed <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: yes
 */

#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;
_force = false;
if (count _this >= 2) then {
    _force = _this select 1;
};

if (!alive _unit) exitwith{};
if (!local _unit) exitwith {
    [[_unit, _force], QUOTE(DFUNC(setDead)), _unit, false] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};

if (GVAR(preventInstaDeath) && !_force) exitwith {
	if (_unit getvariable [QGVAR(inReviveState), false]) exitwith {}; // already in revive state
	_unit setvariable [QGVAR(inReviveState), true, true];
	[_unit] call FUNC(setUnconscious);

	[{
	    private ["_args","_unit","_startTime"];
	    _args = _this select 0;
	    _unit = _args select 0;
	    _startTime = _args select 1;

	    if (time - _startTime > GVAR(maxReviveTime)) exitwith {
	        [(_this select 1)] call cba_fnc_removePerFrameHandler;
	        [_unit, true] call FUNC(setDead);
	        _unit setvariable [QGVAR(inReviveState), nil, true];
	    };

	    if !(_unit getvariable [QGVAR(inReviveState), false]) exitwith {
	        [(_this select 1)] call cba_fnc_removePerFrameHandler;
	    };
	}, 1, [_unit, time] ] call CBA_fnc_addPerFrameHandler;
};

_unit setvariable ["ACE_isDead", true, true];
if (isPLayer _unit) then {
    _unit setvariable ["isDeadPlayer", true, true];
};
_unit setdamage 1;
