/*
 * Author: Glowbal
 * PFH logic for unconscious state
 *
 * Arguments:
 * 0: PFEH - Args
 *      0: The unit that will be put in an unconscious state <OBJECT>
 *      1: unitPos (stance) <STRING>
 *      2: Starting Time <NUMBER>
 *      3: Minimum Waiting Time <NUMBER>
 *      4: Has Moved Out <BOOL>
 *      5: Parachute Check <BOOL>
 * 1: PFEH ID <NUMBER>
 *
 * ReturnValue:
 * None
 *
 * Public: yes
 */
#include "script_component.hpp"

private ["_unit", "_minWaitingTime", "_slotInfo", "_hasMovedOut", "_parachuteCheck", "_args", "_originalPos", "_startingTime", "_awakeInVehicleAnimation", "_oldVehicleAnimation", "_vehicle"];
params ["_args", "_idPFH"];
_args params ["_unit", "_originalPos", "_startingTime", "_minWaitingTime", "_hasMovedOut", "_parachuteCheck"];

if (!alive _unit) exitwith {
    if ("ACE_FakePrimaryWeapon" in (weapons _unit)) then {
        TRACE_1("Removing fake weapon [on death]",_unit);
        _unit removeWeapon "ACE_FakePrimaryWeapon";
    };
    if (GVAR(moveUnitsFromGroupOnUnconscious)) then {
        [_unit, false, "ACE_isUnconscious", side group _unit] call EFUNC(common,switchToGroupSide);
    };
    [_unit, QGVAR(unconscious), false] call EFUNC(common,setCaptivityStatus);
    [_unit, false] call EFUNC(common,disableAI);
    //_unit setUnitPos _originalPos;
    _unit setUnconscious false;

    [_unit, "isUnconscious"] call EFUNC(common,unmuteUnit);
    ["medical_onUnconscious", [_unit, false]] call EFUNC(common,globalEvent);

    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// In case the unit is no longer in an unconscious state, we are going to check if we can already reset the animation
if !(_unit getvariable ["ACE_isUnconscious",false]) exitwith {
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
            _vehicle = vehicle _unit;
            _oldVehicleAnimation = _unit getVariable [QGVAR(vehicleAwakeAnim), []];
            _awakeInVehicleAnimation = "";
            if (((count _oldVehicleAnimation) > 0) && {(_oldVehicleAnimation select 0) == _vehicle}) then {
                _awakeInVehicleAnimation = _oldVehicleAnimation select 1;
            };
            //Make sure we have a valid, non-terminal animation:
            if ((_awakeInVehicleAnimation != "") && {(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> _awakeInVehicleAnimation >> "terminal")) == 0}) then {
                [_unit, _awakeInVehicleAnimation, 2] call EFUNC(common,doAnimation);
            } else {
                //Don't have a valid animation saved, reset the unit animation with a moveInXXX
                TRACE_1("No Valid Animation, doing seat reset", _awakeInVehicleAnimation);
                _slotInfo = [];
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

        ["medical_onUnconscious", [_unit, false]] call EFUNC(common,globalEvent);
        // EXIT PFH
        [_idPFH] call CBA_fnc_removePerFrameHandler;
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
        _args set [4, true];
    };
};

if (_parachuteCheck) then {
    if !(vehicle _unit isKindOf "ParachuteBase") then {
        [_unit, [_unit] call EFUNC(common,getDeathAnim), 1, true] call EFUNC(common,doAnimation);
        _args set [5, false];
    };
};

if (!local _unit) exitwith {
    _args set [3, _minWaitingTime - (ACE_time - _startingTime)];
    _unit setvariable [QGVAR(unconsciousArguments), _args, true];
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// Ensure we are waiting at least a minimum period before checking if we can wake up the unit again, allows for temp knock outs
if ((ACE_time - _startingTime) >= _minWaitingTime) exitwith {
    if (!([_unit] call FUNC(getUnconsciousCondition))) then {
        _unit setvariable ["ACE_isUnconscious", false, true];
    };
};
