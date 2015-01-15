/**
 * fn_setUnconsciousState.sqf
 * @Descr: Sets a unit in the unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */


private ["_unit", "_animState", "_dAnim"];
_unit = _this select 0;

_dAnim = ([_unit] call FUNC(getDeathAnim));
if !([_unit] call FUNC(canGoUnconsciousState)) exitwith{};
if (!local _unit) exitwith {
	[[_unit], QUOTE(FUNC(setUnconsciousState)), _unit, false] spawn EFUNC(common,execRemoteFnc);
};

// get rid of the object we are carrying, before we go unconscious.
[_unit, ObjNull, [0,0,0]] call FUNC(carryObj);

_unit setvariable [QGVAR(StateUnconscious),true,true];
[_unit] call FUNC(setWeaponsCorrectUnconscious);

_animState = animationState _unit;

_originalPos = unitPos _unit;
if (isPlayer _unit) then {
	[] call FUNC(closeAllDialogs_f);
	[true] call FUNC(effectBlackOut);
	["unconscious", true] call FUNC(disableUserInput_f);
	[false] call FUNC(setVolume_f);
} else {
	_unit setUnitPos "DOWN";
	[_unit, true] call FUNC(disableAI_F);
};
[_unit, true, QGVAR(StateUnconscious), side group _unit] call FUNC(switchToGroupSide_f);

_captiveSwitch = [_unit, true] call FUNC(setCaptiveSwitch);
_unit setUnconscious true;
[_unit, _dAnim] call FUNC(localAnim);

[_unit,_animState, _captiveSwitch, _originalPos] spawn {
	private ["_unit", "_vehicleOfUnit","_lockSwitch","_minWaitingTime", "_oldAnimation", "_captiveSwitch"];
	_unit = _this select 0;
	_oldAnimation = _this select 1;
	_captiveSwitch = _this select 2;
	_originalPos = _this select 3;

	_minWaitingTime = (round(random(10)+5));
	_counter = time;
	while {(((time - _counter) < _minWaitingTime) && {alive _unit})} do {
		if (vehicle _unit == _unit && {animationState _unit != "deadState" && animationState _unit != "unconscious"} && {(alive _unit)} && {(isNull ([_unit] call FUNC(getCarriedBy)))}) then {
			[_unit,([_unit] call FUNC(getDeathAnim))] call FUNC(broadcastAnim);
		};
		sleep 0.1;
	};
	waituntil{(!([_unit] call FUNC(getUnconsciousCondition)) || !alive _unit)};
	[format["setUnconsciousState false - %1",_unit]] call FUNC(debug);
	sleep 0.5;
	if (_captiveSwitch) then {
		[_unit, false] call FUNC(setCaptiveSwitch);
	};
	_unit setUnconscious false;
	[_unit, false, QGVAR(StateUnconscious), side group _unit] call FUNC(switchToGroupSide_f);

	if (isPlayer _unit) then {
		[false] call FUNC(effectBlackOut);
		[true] call FUNC(setVolume_f);
		["unconscious", false] call FUNC(disableUserInput_f);
	} else {
		[_unit, false] call FUNC(disableAI_F);
		_unit setUnitPos _originalPos;	// This is not position but stance (DOWN, MIDDLE, UP)
	};

	waituntil {!([_unit] call FUNC(beingCarried))};
	if (alive _unit) then {
		if (vehicle _unit == _unit) then {
			[format["Resetting unit animiation to normal %1",_unit]] call FUNC(debug);
			//[_unit,"",false] call FUNC(broadcastAnim);
			[_unit,"amovppnemstpsnonwnondnon",false] call FUNC(broadcastAnim);
		} else {
			[format["Resetting unit animiation to oldAnimation %1 - %2",_unit, _oldAnimation]] call FUNC(debug);
			[_unit, _oldAnimation,false] call FUNC(broadcastAnim);
		};
		_unit setvariable [QGVAR(StateUnconscious), false, true];
	};
	[[_unit, false],"setUnconsciousState"] call FUNC(customEventHandler_F);
};
[[_unit, true],"setUnconsciousState"] call FUNC(customEventHandler_F);