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

_dAnim = ([_unit] call cse_fnc_getDeathAnim);
if !([_unit] call cse_fnc_canGoUnconsciousState) exitwith{};
if (!local _unit) exitwith {
	[[_unit], "cse_fnc_setUnconsciousState", _unit, false] spawn BIS_fnc_MP;
};

// get rid of the object we are carrying, before we go unconscious.
[_unit, ObjNull, [0,0,0]] call cse_fnc_carryObj;

_unit setvariable ["cse_state_unconscious",true,true];
[_unit] call cse_fnc_setWeaponsCorrectUnconscious;

_animState = animationState _unit;

_originalPos = unitPos _unit;
if (isPlayer _unit) then {
	[] call cse_fnc_closeAllDialogs_f;
	[true] call cse_fnc_effectBlackOut;
	["unconscious", true] call cse_fnc_disableUserInput_f;
	[false] call cse_fnc_setVolume_f;

	/* Disable this, because the disableUserInput function call above - users already cannot leave vehicles because of that function. */
	//[_unit] spawn cse_fnc_lockVehicleOfUnitUntil;
} else {
	_unit setUnitPos "DOWN";
	[_unit, true] call cse_fnc_disableAI_F;
};
[_unit, true, "cse_unconsciousState", side group _unit] call cse_fnc_switchToGroupSide_f;

_captiveSwitch = [_unit, true] call cse_fnc_setCaptiveSwitch;
_unit setUnconscious true;
[_unit, _dAnim] call cse_fnc_localAnim;

[_unit,_animState, _captiveSwitch, _originalPos] spawn {
	private ["_unit", "_vehicleOfUnit","_lockSwitch","_minWaitingTime", "_oldAnimation", "_captiveSwitch"];
	_unit = _this select 0;
	_oldAnimation = _this select 1;
	_captiveSwitch = _this select 2;
	_originalPos = _this select 3;

	_minWaitingTime = (round(random(10)+5));
	_counter = time;
	while {(((time - _counter) < _minWaitingTime) && {alive _unit})} do {
		if (vehicle _unit == _unit && {animationState _unit != "deadState" && animationState _unit != "unconscious"} && {(alive _unit)} && {(isNull ([_unit] call cse_fnc_getCarriedBy))}) then {
			[_unit,([_unit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;
		};
		sleep 0.1;
	};
	waituntil{(!([_unit] call cse_fnc_getUnconsciousCondition) || !alive _unit)};
	[format["setUnconsciousState false - %1",_unit]] call cse_fnc_debug;
	sleep 0.5;
	if (_captiveSwitch) then {
		[_unit, false] call cse_fnc_setCaptiveSwitch;
	};
	_unit setUnconscious false;
	[_unit, false, "cse_unconsciousState", side group _unit] call cse_fnc_switchToGroupSide_f;

	if (isPlayer _unit) then {
		[false] call cse_fnc_effectBlackOut;
		[true] call cse_fnc_setVolume_f;
		["unconscious", false] call cse_fnc_disableUserInput_f;
	} else {
		[_unit, false] call cse_fnc_disableAI_F;
		_unit setUnitPos _originalPos;	// This is not position but stance (DOWN, MIDDLE, UP)
	};

	waituntil {!([_unit] call cse_fnc_beingCarried)};
	if (alive _unit) then {
		if (vehicle _unit == _unit) then {
			[format["Resetting unit animiation to normal %1",_unit]] call cse_fnc_debug;
			//[_unit,"",false] call cse_fnc_broadcastAnim;
			[_unit,"amovppnemstpsnonwnondnon",false] call cse_fnc_broadcastAnim;
		} else {
			[format["Resetting unit animiation to oldAnimation %1 - %2",_unit, _oldAnimation]] call cse_fnc_debug;
			[_unit, _oldAnimation,false] call cse_fnc_broadcastAnim;
		};
		_unit setvariable ["cse_state_unconscious", false, true];
	};
	[[_unit, false],"setUnconsciousState"] call cse_fnc_customEventHandler_F;
};
[[_unit, true],"setUnconsciousState"] call cse_fnc_customEventHandler_F;