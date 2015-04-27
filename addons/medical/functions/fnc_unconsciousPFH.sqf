/*
 * Author: Glowbal
 * PFH logic for unconscious state
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

private ["_unit", "_vehicleOfUnit","_minWaitingTime", "_oldAnimation", "_captiveSwitch", "_hasMovedOut", "_parachuteCheck"];
_args = _this select 0;
_unit = _args select 0;
_oldAnimation = _args select 1;
_originalPos = _args select 2;
_startingTime = _args select 3;
_minWaitingTime = _args select 4;
_hasMovedOut = _args select 5;
_parachuteCheck = _args select 6;

if (!alive _unit) exitwith {
    if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
        [_unit, false, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
    };
    [_unit, QGVAR(unconscious), false] call EFUNC(common,setCaptivityStatus);
    [_unit, false] call EFUNC(common,disableAI);
    //_unit setUnitPos _originalPos;
    _unit setUnconscious false;

    [_unit, "isUnconscious"] call EFUNC(common,unmuteUnit);
    ["medical_onUnconscious", [_unit, false]] call EFUNC(common,globalEvent);

    [(_this select 1)] call cba_fnc_removePerFrameHandler;
};

// In case the unit is no longer in an unconscious state, we are going to check if we can already reset the animation
if !(_unit getvariable ["ACE_isUnconscious",false]) exitwith {
    // TODO, handle this with carry instead, so we can remove the PFH here.
    // Wait until the unit isn't being carried anymore, so we won't end up with wierd animations
    if !(([_unit] call FUNC(isBeingCarried)) || ([_unit] call FUNC(isBeingDragged))) then {
        if (vehicle _unit == _unit) then {
            if (animationState _unit == "AinjPpneMstpSnonWrflDnon") then {
                [_unit,"AinjPpneMstpSnonWrflDnon_rolltofront", 2] call EFUNC(common,doAnimation);
                [_unit,"amovppnemstpsnonwnondnon", 1] call EFUNC(common,doAnimation);
            } else {
                [_unit,"amovppnemstpsnonwnondnon", 2] call EFUNC(common,doAnimation);
            };
        } else {
            // Switch to the units original animation, assuming
            // TODO: what if the unit switched vehicle?
            [_unit, _oldAnimation, 2] call EFUNC(common,doAnimation);
        };
        ["medical_onUnconscious", [_unit, false]] call EFUNC(common,globalEvent);
        // EXIT PFH
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
    if (!_hasMovedOut) then {
        // Reset the unit back to the previous captive state.
        [_unit, QGVAR(unconscious), false] call EFUNC(common,setCaptivityStatus);

        // Swhich the unit back to its original group
        //Unconscious units shouldn't be put in another group #527:
        if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
            [_unit, false, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
        };
        [_unit, false] call EFUNC(common,disableAI);
        _unit setUnitPos _originalPos; // This is not position but stance (DOWN, MIDDLE, UP)

        _unit setUnconscious false;

        [_unit, "isUnconscious"] call EFUNC(common,unmuteUnit);

        // ensure this statement runs only once
        _args set [5, true];
    };
};

if (_parachuteCheck) then {
    if !(vehicle _unit isKindOf "ParachuteBase") then {
        [_unit, [_unit] call EFUNC(common,getDeathAnim), 1, true] call EFUNC(common,doAnimation);
        _args set [6, false];
    };
};

if (!local _unit) exitwith {
    _args set [ 4, _minWaitingTime - (time - _startingTime)];
    _unit setvariable [QGVAR(unconsciousArguments), _args, true];
    [(_this select 1)] call cba_fnc_removePerFrameHandler;
};

// Ensure we are waiting at least a minimum period before checking if we can wake up the unit again, allows for temp knock outs
if ((time - _startingTime) >= _minWaitingTime) exitwith {
    if (!([_unit] call FUNC(getUnconsciousCondition))) then {
        _unit setvariable ["ACE_isUnconscious", false, true];
    };
};
