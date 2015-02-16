/*
 * Author: commy2 PabstMirror
 * Lets a unit surrender
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to surrender, false to un-surrender <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [Pierre, true] call ACE_captives_fnc_surrender;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_state);

// We only want this function to work on local machines
if (!local _unit) exitwith {
    [_this, QUOTE(FUNC(surrender)), _unit] call EFUNC(common,execRemoteFnc);
    TRACE_2("running surrender on remote unit",_unit,_state);
};

if ((_unit getVariable [QGVAR(isSurrendering), false]) isEqualTo _state) then {
    LOG("Surrender: current state same as new");
};

if (_state) then {
    _unit setVariable [QGVAR(isSurrendering), true, true];
    [_unit, QGVAR(Surrendered), true] call EFUNC(common,setCaptivityStatus);

    if (_unit == ACE_player) then {
        showHUD false;
    };

    // fix anim on mission start (should work on dedicated servers)
    [{
        PARAMS_1(_unit);
        if (_unit getVariable [QGVAR(isSurrendering), false] && {vehicle _unit == _unit}) then {
            [_unit] call EFUNC(common,fixLoweredRifleAnimation);
            [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);
        };

        //Adds an animation changed eh
        //If we get a change in animation before we've "locked" in the hands up animationState, then stop surrendering
        _animChangedEHID = _unit addEventHandler ["AnimChanged", {
            PARAMS_2(_unit,_newAnimation);

            if (_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") then {
                if ((animationState _unit != "ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon") && (animationState _unit != "ACE_AmovPercMstpSsurWnonDnon")) then {
                    ERROR("Surrender animation failed");
                    systemChat "Debug: Surrender animation failed";
                    [_unit, false] call FUNC(surrender);
                };
            };
        }];
        _unit setVariable [QGVAR(surrenderAnimEHID), _animChangedEHID];

    }, [_unit], 0.01, 0] call EFUNC(common,waitAndExecute);
} else {
    _unit setVariable [QGVAR(isSurrendering), false, true];
    [_unit, QGVAR(Surrendered), false] call EFUNC(common,setCaptivityStatus);

    _animChangedEHID = _unit getVariable [QGVAR(surrenderAnimEHID), -1];
    _unit removeEventHandler ["AnimChanged", _animChangedEHID];
    _unit setVariable [QGVAR(surrenderAnimEHID), -1];

    if (_unit == ACE_player) then {
        //only re-enable HUD if not handcuffed
        if (!(_unit getVariable [QGVAR(isHandcuffed), false])) then {
            showHUD true;
        };
    };

    //if we are in "hands up" animationState, crack it now
    if (((vehicle _unit) == _unit) && {(animationState _unit) == "ACE_AmovPercMstpSsurWnonDnon"}) then {
        [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    } else {
        //spin up a PFEH, to watching animationState for the next 20 seconds to make sure we don't enter
        //Handles long animation chains
        [{
            PARAMS_2(_args,_pfID);
            EXPLODE_2_PVT(_args,_unit,_maxTime);
            //If maxtime or they re-surrendered, exit loop
            if ((time > _maxTime) || {_unit getVariable [QGVAR(isSurrendering), false]}) exitWith {
                [_pfID] call CBA_fnc_removePerFrameHandler;
            };
            //Only break animation if they are actualy the "hands up" animation (because we are using switchmove)
            if (((vehicle _unit) == _unit) && {(animationState _unit) == "ACE_AmovPercMstpSsurWnonDnon"}) exitWith {
                [_pfID] call CBA_fnc_removePerFrameHandler;
                //Break out of hands up animation loop (doAnimation handles Unconscious prioity)
                [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
            };
        }, 0.05, [_unit, (time + 20)]] call CBA_fnc_addPerFrameHandler;
    };
};
