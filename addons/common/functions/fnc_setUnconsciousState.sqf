/**
 * fn_setUnconsciousState.sqf
 * @Descr: Sets a unit in the unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit", "_animState", "_dAnim"];
_unit = _this select 0;

if !([_unit] call FUNC(canGoUnconsciousState)) exitwith{};
if (!local _unit) exitwith {
	[[_unit], QUOTE(FUNC(setUnconsciousState)), _unit, false] call EFUNC(common,execRemoteFnc);
};

_dAnim = ([_unit] call FUNC(getDeathAnim));

// get rid of the object we are carrying, before we go unconscious.
[_unit, ObjNull, [0,0,0]] call FUNC(carryObj);

_unit setvariable [QGVAR(StateUnconscious),true,true];
[_unit] call FUNC(setWeaponsCorrectUnconscious);

_animState = animationState _unit;

_originalPos = unitPos _unit;
if (isPlayer _unit) then {
	[] call FUNC(closeAllDialogs_f);
	[true] call EFUNC(GUI,effectBlackOut);
	["unconscious", true] call FUNC(disableUserInput_f);
	[false] call FUNC(setVolume_f);
} else {
	_unit setUnitPos "DOWN";
	[_unit, true] call FUNC(disableAI_F);
};
[_unit, true, QGVAR(StateUnconscious), side group _unit] call FUNC(switchToGroupSide_f);

_captiveSwitch = [_unit, true] call FUNC(setCaptiveSwitch);
_unit setUnconscious true;
[_unit, _dAnim, 1, true] call FUNC(doAnimation);

_startingTime = time;
_minWaitingTime = (round(random(10)+5));
[{
	private ["_unit", "_vehicleOfUnit","_lockSwitch","_minWaitingTime", "_oldAnimation", "_captiveSwitch"];
	_args = _this select 0;
	_unit = _args select 0;
	_oldAnimation = _args select 1;
	_captiveSwitch = _args select 2;
	_originalPos = _args select 3;
	_startingTime = _args select 4;
	_minWaitingTime = _args select 5;

	// Since the unit is no longer alive, get rid of this PFH.
	if (!alive _unit) exitwith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
		[[_unit, false],"setUnconsciousState"] call FUNC(raiseScriptedEvent_f);
	};

	// In case the unit is no longer in an unconscious state, we are going to check if we can already reset the animation
	if !([_unit] call FUNC(isUnconscious)) exitwith {

		// Wait until the unit isn't being carried anymore, so we won't end up with wierd animations
		if !([_unit] call FUNC(beingCarried)) then {
			if (vehicle _unit == _unit) then {
				[_unit,"amovppnemstpsnonwnondnon", 1] call FUNC(doAnimation);
			} else {
				// Switch to the units original animation, assuming
				// TODO: what if the unit switched vehicle?
				[_unit, _oldAnimation, 1] call FUNC(doAnimation);
			};
			[(_this select 1)] call cba_fnc_removePerFrameHandler;
			[[_unit, false],"setUnconsciousState"] call FUNC(raiseScriptedEvent_f);
		};
	};
	// Ensure we are waiting at least a minimum period before checking if we can wake up the unit again, allows for temp knock outs
	if ((time - _startingTime) >= _minWaitingTime) exitwith {

		// Wait until the unit is no longer unconscious
		if (!([_unit] call FUNC(getUnconsciousCondition))) then {

			// Reset the unit back to the previous captive state.
			if (_captiveSwitch) then {
				[_unit, false] call FUNC(setCaptiveSwitch);
			};
			_unit setUnconscious false;

			// Swhich the unit back to its original group
			[_unit, false, QGVAR(StateUnconscious), side group _unit] call FUNC(switchToGroupSide_f);

			// Reset any visual and audio effects for players, or enable everything again for AI.
			if (isPlayer _unit) then {
				[false] call EFUNC(GUI,effectBlackOut);
				[true] call FUNC(setVolume_f);
				["unconscious", false] call FUNC(disableUserInput_f);
			} else {
				[_unit, false] call FUNC(disableAI_F);
				_unit setUnitPos _originalPos;	// This is not position but stance (DOWN, MIDDLE, UP)
			};

			// Move unit out of unconscious state
			_unit setvariable [QGVAR(StateUnconscious), false, true];
		};
	};

	// A check to ensure that the animation is being played properly.
	// TODO: Might no longer be necessary: Have to test this in MP
	if (vehicle _unit == _unit && {animationState _unit != "deadState" && animationState _unit != "unconscious"} && {(isNull ([_unit] call FUNC(getCarriedBy)))}) then {
		[_unit,([_unit] call FUNC(getDeathAnim)), 1, true] call FUNC(doAnimation); // Reset animations if unit starts doing wierd things.
	};

}, 0.1, [_unit,_animState, _captiveSwitch, _originalPos, _startingTime, _minWaitingTime] ] call CBA_fnc_addPerFrameHandler;

[[_unit, true],"setUnconsciousState"] call FUNC(raiseScriptedEvent_f);
