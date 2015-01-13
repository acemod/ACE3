/**
 * fn_setDead.sqf
 * @Descr: Kills a unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit"];
_unit = _this select 0;
_force = false;
if (count _this >= 2) then {
	_force = _this select 1;
};

if (!alive _unit) exitwith{};
if (!local _unit) exitwith {
	[[_unit, _force], "cse_fnc_setDead", _unit, false] spawn BIS_fnc_MP;
	diag_log format["WARNING: cse_fnc_setDead triggered on non local unit %1", _unit];
};
if (isnil "CSE_ENABLE_REVIVE_F") then {
	CSE_ENABLE_REVIVE_F = 0;
};
_name = _unit getvariable "cse_name";
if (isnil "_name") then {
	_unit setvariable ["cse_name", name _unit, true];
};

if (((CSE_ENABLE_REVIVE_F == 1 && isPlayer _unit) || (CSE_ENABLE_REVIVE_F == 2)) && !_force) then {
	[format["CSE_ENABLE_REVIVE_F %1",_unit]] call cse_fnc_debug;
	_unit spawn {
		private ["_unit","_counter"];
		_unit = _this;
		_playerDead = isPlayer _unit;

		if ((_unit getvariable["CSE_ENABLE_REVIVE_SETDEAD_F",0]) > 0) exitwith {
			_unit setvariable["CSE_ENABLE_REVIVE_SETDEAD_F",(_unit getvariable["CSE_ENABLE_REVIVE_SETDEAD_F",0]) + 1];
		};
		_unit setvariable["CSE_ENABLE_REVIVE_SETDEAD_F",1];
		[_unit] call cse_fnc_setUnconsciousState;
		if (isnil "CSE_REVIVE_TIMER_F") then {
			CSE_REVIVE_TIMER_F = 10;
		};
		if (isnil "CSE_REVIVE_NUMBER_MAX_F") then {
			CSE_REVIVE_NUMBER_MAX_F = -1;
		};
		waituntil {([_unit] call cse_fnc_isUnconscious)};
		_counter = 0;
		if (alive (vehicle _unit)) then {
			_unit setvariable ["cse_inReviveState", true, true];
			while {([_unit] call cse_fnc_isUnconscious)} do {
				_counter = _unit getvariable ["CSE_ENABLE_REVIVE_COUNTER",_counter];
				if (_counter > CSE_REVIVE_TIMER_F || (((_unit getvariable["CSE_ENABLE_REVIVE_SETDEAD_F",0]) > CSE_REVIVE_NUMBER_MAX_F) && (CSE_REVIVE_NUMBER_MAX_F > 0))) exitwith{
					if (_counter > CSE_REVIVE_TIMER_F) then {
						[format["Timer ran out for %1",_unit]] call cse_fnc_debug;
					};
					if (((_unit getvariable["CSE_ENABLE_REVIVE_SETDEAD_F",0]) > CSE_REVIVE_NUMBER_MAX_F) && (CSE_REVIVE_NUMBER_MAX_F > 0)) then {
						[format["amount of calls for setDead ran out for %1",_unit]] call cse_fnc_debug;
					};
					if (isPlayer _unit) then {
						titleText ["You died..","PLAIN DOWN"];
					};
					[format["cse_isDead %1",_unit]] call cse_fnc_debug;
					[_unit,"cse_isDead",true,true] call cse_fnc_setVariable;
					if (_playerDead) then {
						[_unit,"cse_isDeadPlayer",true,true] call cse_fnc_setVariable;
					};
					_unit setdamage 1;
					[[_unit, true],"killed"] call cse_fnc_customEventHandler_F;
				};
				sleep 1;
				_unit setvariable ["CSE_ENABLE_REVIVE_COUNTER",_counter + 1];
				_counter = _counter + 1;
			};
			_unit setvariable ["cse_inReviveState", nil, true];
			[format["no longer unconscious %1",_unit]] call cse_fnc_debug;
		} else {
			if (isPlayer _unit) then {
				titleText ["You died..","PLAIN DOWN"];
			};
			[_unit,"cse_isDead",true,true] call cse_fnc_setVariable;
			_unit setdamage 1;
			[[_unit, false],"killed"] call cse_fnc_customEventHandler_F;
		};
	};
} else {
	[format["INSTANT KILL %1",_unit]] call cse_fnc_debug;
	_unit setvariable ["cse_isUnconscious", true, true];
	if (isPlayer _unit) then {
		titleText ["You died..","PLAIN DOWN"];
	};
	if (isPLayer _unit) then {
		[_unit,"cse_isDeadPlayer",true,true] call cse_fnc_setVariable;
	};
	_unit setdamage 1;
	[_unit,"cse_isDead",true,true] call cse_fnc_setVariable;

	[[_unit, false],"killed"] call cse_fnc_customEventHandler_F;
};