/*
 * Author: Glowbal
 * PFH logic for unconscious state
 *
 * Arguments:
 * 0: PFEH - <ARRAY>
 *      0: The unit that will be put in an unconscious state <OBJECT>
 *      1: unitPos (stance) <STRING>
 *      2: Starting Time <NUMBER>
 *      3: Minimum Waiting Time <NUMBER>
 *      4: Has Moved Out <BOOL>
 *      5: Parachute Check <BOOL>
 * 1: PFEH ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unit,"pos", 5, 5, true, false], 5], "classname"] call ace_medical_fnc_unconsciousPFH
 *
 * Public: yes
 */

#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_unit", "_originalPos", "_startingTime", "_minWaitingTime", "_hasMovedOut", "_parachuteCheck"];

TRACE_6("ACE_DEBUG_Unconscious_PFH",_unit, _originalPos, _startingTime, _minWaitingTime, _hasMovedOut, _parachuteCheck);

if (!alive _unit) exitWith {
    if ("ACE_FakePrimaryWeapon" in (weapons _unit)) then {
        TRACE_1("Removing fake weapon [on death]",_unit);
        _unit removeWeapon "ACE_FakePrimaryWeapon";
    };
    if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
        [_unit, false, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
    };
    [_unit, "setHidden", "ace_unconscious", false] call EFUNC(common,statusEffect_set);
    [_unit, false] call EFUNC(common,disableAI);
    //_unit setUnitPos _originalPos;

    [_unit, "isUnconscious"] call EFUNC(common,unmuteUnit);
    ["ace_unconscious", [_unit, false]] call CBA_fnc_globalEvent;

    TRACE_3("ACE_DEBUG_Unconscious_Exit",_unit, (!alive _unit) , "ace_unconscious");

    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// In case the unit is no longer in an unconscious state, we are going to check if we can already reset the animation
if !(_unit getVariable ["ACE_isUnconscious",false]) exitWith {
    TRACE_7("ACE_DEBUG_Unconscious_PFH",_unit, _args, [_unit] call FUNC(isBeingCarried), [_unit] call FUNC(isBeingDragged), _idPFH, _unit getVariable QGVAR(unconsciousArguments),animationState _unit);

    //Unmute the unit before the carry check
    _unit setVariable ["tf_voiceVolume", 1, true];
    _unit setVariable ["tf_unable_to_use_radio", false, true];
    _unit setVariable ["acre_sys_core_isDisabled", false, true];

    // TODO, handle this with carry instead, so we can remove the PFH here.
    // Wait until the unit isn't being carried anymore, so we won't end up with wierd animations
    if !(([_unit] call FUNC(isBeingCarried)) || ([_unit] call FUNC(isBeingDragged))) then {
        if ("ACE_FakePrimaryWeapon" in (weapons _unit)) then {
            TRACE_1("Removing fake weapon [on wakeup]",_unit);
            _unit removeWeapon "ACE_FakePrimaryWeapon";
        };

        if (vehicle _unit == _unit) then {
            if (animationState _unit == "AinjPpneMstpSnonWrflDnon") then {
                [_unit,"AinjPpneMstpSnonWrflDnon_rolltofront", 2] call EFUNC(common,doAnimation);
                [_unit,"amovppnemstpsnonwnondnon", 1] call EFUNC(common,doAnimation);
            } else {
                [_unit,"amovppnemstpsnonwnondnon", 2] call EFUNC(common,doAnimation);
            };
        } else {
            private _vehicle = vehicle _unit;
            private _oldVehicleAnimation = _unit getVariable [QGVAR(vehicleAwakeAnim), []];
            private _awakeInVehicleAnimation = "";
            if (((count _oldVehicleAnimation) > 0) && {(_oldVehicleAnimation select 0) == _vehicle}) then {
                _awakeInVehicleAnimation = _oldVehicleAnimation select 1;
            };
            //Make sure we have a valid, non-terminal animation:
            if ((_awakeInVehicleAnimation != "") && {(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> _awakeInVehicleAnimation >> "terminal")) == 0}) then {
                [_unit, _awakeInVehicleAnimation, 2] call EFUNC(common,doAnimation);
            } else {
                //Don't have a valid animation saved, reset the unit animation with a moveInXXX
                TRACE_1("No Valid Animation, doing seat reset", _awakeInVehicleAnimation);
                private _slotInfo = [];
                {if ((_x select 0) == _unit) exitWith {_slotInfo = _x;};} forEach (fullCrew _vehicle);
                if (_slotInfo isEqualTo []) exitWith {ERROR("No _slotInfo?");};
                //Move the unit out:
                _unit setPosASL ((getPosASL _unit) vectorAdd [0,0,100]);
                //Move the unit back into old seat:
                if ((_slotInfo select 1) == "driver") then {
                    _unit moveInDriver _vehicle;
                } else {
                    if ((_slotInfo select 1) == "cargo") then {
                        _unit moveInCargo [_vehicle, (_slotInfo select 2)];
                    } else {
                        _unit moveInTurret [_vehicle, (_slotInfo select 3)];
                    };
                };
            };
        };
        _unit setVariable [QGVAR(vehicleAwakeAnim), nil];

        ["ace_unconscious", [_unit, false]] call CBA_fnc_globalEvent;
        // EXIT PFH
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
    if (!_hasMovedOut) then {
        // Reset the unit back to the previous captive state.
        [_unit, "setHidden", "ace_unconscious", false] call EFUNC(common,statusEffect_set);

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
        _args set [4, true];
    };
};

if (_parachuteCheck) then {
    if !(vehicle _unit isKindOf "ParachuteBase") then {
        [_unit, [_unit] call EFUNC(common,getDeathAnim), 1, true] call EFUNC(common,doAnimation);
        _args set [5, false];
    };
};

if (!local _unit) exitWith {
    TRACE_6("ACE_DEBUG_Unconscious_PFH",_unit, _args, _startingTime, _minWaitingTime, _idPFH, _unit getVariable QGVAR(unconsciousArguments));
    _args set [3, _minWaitingTime - (CBA_missionTime - _startingTime)];
    _unit setVariable [QGVAR(unconsciousArguments), _args, true];
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// Ensure we are waiting at least a minimum period before checking if we can wake up the unit again, allows for temp knock outs
if ((CBA_missionTime - _startingTime) >= _minWaitingTime) exitWith {
    TRACE_2("ACE_DEBUG_Unconscious_Temp knock outs",_unit, [_unit] call FUNC(getUnconsciousCondition));
    if (!([_unit] call FUNC(getUnconsciousCondition))) then {
        _unit setVariable ["ACE_isUnconscious", false, true];
    };
};
