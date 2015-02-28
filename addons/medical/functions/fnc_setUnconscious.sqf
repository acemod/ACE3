/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 *
 * ReturnValue:
 * nil
 *
 * Public: yes
 */

#include "script_component.hpp"

private ["_unit", "_set", "_animState", "_originalPos", "_captiveSwitch", "_startingTime","_minWaitingTime"];
_unit = _this select 0;
_set = if (count _this > 1) then {_this select 0} else {true};

if !(_set) exitwith {
    _unit setvariable ["ACE_isUnconscious", false,true];
};

if !(!(isNull _unit) && {(_unit isKindOf "CaManBase") && ([_unit] call EFUNC(common,isAwake))}) exitwith{};

// We only want this function to work on local machines
if (!local _unit) exitwith {
    [[_unit], QUOTE(FUNC(setUnconsciousState)), _unit, false] call EFUNC(common,execRemoteFnc);
};

// Get rid of the object we are carrying, before we go unconscious.
[_unit, ObjNull, [0,0,0]] call EFUNC(common,carryObj);

// Set the unit in the unconscious state.
_unit setvariable ["ACE_isUnconscious",true,true];
_unit setUnconscious true;

// If a unit has the launcher out, it will sometimes start selecting the primairy weapon while unconscious,
// therefor we force it to select the primairy weapon before going unconscious
if ((vehicle _unit) isKindOf "StaticWeapon") then {
    moveOut _unit;
    unassignVehicle _unit;
    //_unit action ["eject", vehicle _unit];
};
if (animationState _unit in ["ladderriflestatic","laddercivilstatic"]) then {
    _unit action ["ladderOff", (nearestBuilding _unit)];
};
if (vehicle _unit == _unit) then {
    if (primaryWeapon _unit == "") then {
        _unit addWeapon "ACE_fakeWeapon";
    };
    _unit selectWeapon (primaryWeapon _unit);
    _unit switchMove "";
    _unit playmoveNow "";
};

// We are storing the current animation, so we can use it later on when waking the unit up inside a vehicle
_animState = animationState _unit;
_originalPos = unitPos _unit;

// Handle the on screen effects
if (isPlayer _unit) then {
    //[] call EFUNC(common,closeAllDialogs_f);
    //[true] call FUNC(effectBlackOut);
    //["unconscious", true] call EFUNC(common,setDisableUserInputStatus);
    //[false] call EFUNC(common,setVolume_f);
} else {
    //_unit setUnitPos "DOWN";
    //[_unit, true] call EFUNC(common,disableAI_F);
};

// So the AI does not get stuck, we are moving the unit to a temp group on its own.
[_unit, true, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);

_captiveSwitch = false; // [_unit, true] call EFUNC(common,setCaptiveSwitch);
[_unit, [_unit] call EFUNC(common,getDeathAnim), 1, true] call EFUNC(common,doAnimation);

_startingTime = time;
_minWaitingTime = (round(random(10)+5));

[{
    private ["_unit", "_vehicleOfUnit","_lockSwitch","_minWaitingTime", "_oldAnimation", "_captiveSwitch", "_hasMovedOut"];
    _args = _this select 0;
    _unit = _args select 0;
    _oldAnimation = _args select 1;
    _captiveSwitch = _args select 2;
    _originalPos = _args select 3;
    _startingTime = _args select 4;
    _minWaitingTime = _args select 5;
    _hasMovedOut = _args select 6;
    // Since the unit is no longer alive, get rid of this PFH.
    if (!alive _unit) exitwith {
        // EXIT PFH
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };

    // In case the unit is no longer in an unconscious state, we are going to check if we can already reset the animation
    if !(_unit getvariable ["ACE_isUnconscious",false]) exitwith {
        // TODO, handle this with carry instead, so we can remove the PFH here.
        // Wait until the unit isn't being carried anymore, so we won't end up with wierd animations
        if !([_unit] call EFUNC(common,beingCarried)) then {
            if (vehicle _unit == _unit) then {
                [_unit,"amovppnemstpsnonwnondnon", 1] call EFUNC(common,doAnimation);
            } else {
                // Switch to the units original animation, assuming
                // TODO: what if the unit switched vehicle?
                [_unit, _oldAnimation, 1] call EFUNC(common,doAnimation);
            };

            // EXIT PFH
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
        if (!_hasMovedOut) then {
            // Reset the unit back to the previous captive state.
            if (_captiveSwitch) then {
            //    [_unit, false] call EFUNC(common,setCaptiveSwitch);
            };

            // Swhich the unit back to its original group
            [_unit, false, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);

            // Reset any visual and audio effects for players, or enable everything again for AI.
            if (isPlayer _unit) then {
                //[false] call FUNC(effectBlackOut);
                //[true] call EFUNC(common,setVolume_f);
                //["unconscious", false] call EFUNC(common,setDisableUserInputStatus);
            } else {
                //[_unit, false] call EFUNC(common,disableAI_F);
                //_unit setUnitPos _originalPos;    // This is not position but stance (DOWN, MIDDLE, UP)
            };
            _unit setUnconscious false;

            // ensure this statement runs only once
            _args set [6, true];
        };
    };

    // Ensure we are waiting at least a minimum period before checking if we can wake up the unit again, allows for temp knock outs
    if ((time - _startingTime) >= _minWaitingTime) exitwith {

        // Wait until the unit is no longer unconscious
        if (!([_unit] call FUNC(getUnconsciousCondition))) then {
            // Move unit out of unconscious state
            _unit setvariable ["ACE_isUnconscious", false, true];
        };
    };

    // A check to ensure that the animation is being played properly.
    // TODO: Might no longer be necessary: Have to test this in MP.
    if (vehicle _unit == _unit && {animationState _unit != "deadState" && animationState _unit != "unconscious"} && {(isNull ([_unit] call EFUNC(common,getCarriedBy)))} && (time - _startingTime >= 0.5)) then {
        [_unit,([_unit] call FUNC(getDeathAnim)), 1, true] call EFUNC(common,doAnimation); // Reset animations if unit starts doing wierd things.
    };

}, 0.1, [_unit,_animState, _captiveSwitch, _originalPos, _startingTime, _minWaitingTime, false] ] call CBA_fnc_addPerFrameHandler;

