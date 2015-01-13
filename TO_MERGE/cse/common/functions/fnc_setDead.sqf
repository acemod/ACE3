/**
 * fn_setDead.sqf
 * @Descr: Kills a unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
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
	[[_unit, _force], QUOTE(FUNC(setDead)), _unit, false] spawn BIS_fnc_MP;
	diag_log format["WARNING: ace_common_fnc_setDead triggered on non local unit %1", _unit];
};
if (isnil QGVAR(ENABLE_REVIVE_F)) then {
	GVAR(ENABLE_REVIVE_F) = 0;
};
_name = _unit getvariable QGVAR(name);
if (isnil "_name") then {
	_unit setvariable [QGVAR(name), name _unit, true];
};

if (((GVAR(ENABLE_REVIVE_F) == 1 && isPlayer _unit) || (GVAR(ENABLE_REVIVE_F) == 2)) && !_force) then {
	[format["GVAR(ENABLE_REVIVE_F) %1",_unit]] call FUNC(debug);
	_unit spawn {
		private ["_unit","_counter"];
		_unit = _this;
		_playerDead = isPlayer _unit;

		if ((_unit getvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),0]) > 0) exitwith {
			_unit setvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),(_unit getvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),0]) + 1];
		};
		_unit setvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),1];
		[_unit] call FUNC(setUnconsciousState);
		if (isnil QGVAR(REVIVE_TIMER_F)) then {
			GVAR(REVIVE_TIMER_F) = 10;
		};
		if (isnil QGVAR(REVIVE_NUMBER_MAX_F)) then {
			GVAR(REVIVE_NUMBER_MAX_F) = -1;
		};
		waituntil {([_unit] call FUNC(isUnconscious))};
		_counter = 0;
		if (alive (vehicle _unit)) then {
			_unit setvariable [QGVAR(inReviveState), true, true];
			while {([_unit] call FUNC(isUnconscious))} do {
				_counter = _unit getvariable [QGVAR(ENABLE_REVIVE_COUNTER),_counter];
				if (_counter > GVAR(REVIVE_TIMER_F) || (((_unit getvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),0]) > GVAR(REVIVE_NUMBER_MAX_F)) && (GVAR(REVIVE_NUMBER_MAX_F) > 0))) exitwith{
					if (_counter > GVAR(REVIVE_TIMER_F)) then {
						[format["Timer ran out for %1",_unit]] call FUNC(debug);
					};
					if (((_unit getvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),0]) > GVAR(REVIVE_NUMBER_MAX_F)) && (GVAR(REVIVE_TIMER_F) > 0)) then {
						[format["amount of calls for setDead ran out for %1",_unit]] call FUNC(debug);
					};
					if (isPlayer _unit) then {
						titleText ["You died..","PLAIN DOWN"];
					};
					[format["ace_isDead %1",_unit]] call FUNC(debug);
					[_unit,QGVAR(isDead),true,true] call FUNC(setDefinedVariable);
					if (_playerDead) then {
						[_unit,QGVAR(isDeadPlayer),true,true] call FUNC(setDefinedVariable);
					};
					_unit setdamage 1;
					[[_unit, true],"killed"] call FUNC(customEventHandler_F);
				};
				sleep 1;
				_unit setvariable [QGVAR(ENABLE_REVIVE_COUNTER),_counter + 1];
				_counter = _counter + 1;
			};
			_unit setvariable [QGVAR(inReviveState), nil, true];
			[format["no longer unconscious %1",_unit]] call FUNC(debug);
		} else {
			if (isPlayer _unit) then {
				titleText ["You died..","PLAIN DOWN"];
			};
			[_unit,QGVAR(isDead),true,true] call FUNC(setDefinedVariable);
			_unit setdamage 1;
			[[_unit, false],"killed"] call FUNC(customEventHandler_F);
		};
	};
} else {
	[format["INSTANT KILL %1",_unit]] call FUNC(debug);
	_unit setvariable ["cse_isUnconscious", true, true];
	if (isPlayer _unit) then {
		titleText ["You died..","PLAIN DOWN"];
	};
	if (isPLayer _unit) then {
		[_unit,QGVAR(isDeadPlayer),true,true] call FUNC(setDefinedVariable);
	};
	_unit setdamage 1;
	[_unit,QGVAR(isDead),true,true] call FUNC(setDefinedVariable);

	[[_unit, false],"killed"] call FUNC(customEventHandler_F);
};