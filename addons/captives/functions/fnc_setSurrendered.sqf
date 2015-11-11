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
 * [Pierre, true] call ACE_captives_fnc_setSurrendered;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_state"];
TRACE_2("params",_unit,_state);

if (!local _unit) exitwith {
    ERROR("running surrender on remote unit");
};

if ((_unit getVariable [QGVAR(isSurrendering), false]) isEqualTo _state) exitWith {
    ERROR("Surrender: current state same as new");
};

if (_state) then {
    if ((vehicle _unit) != _unit) exitWith {ERROR("Cannot surrender while mounted");};
    if (_unit getVariable [QGVAR(isHandcuffed), false]) exitWith {ERROR("Cannot surrender while handcuffed");};

    _unit setVariable [QGVAR(isSurrendering), true, true];

    [_unit, QGVAR(Surrendered), true] call EFUNC(common,setCaptivityStatus);

    if (_unit == ACE_player) then {
        showHUD false;
    };

    [_unit] call EFUNC(common,fixLoweredRifleAnimation);
    [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);

    // fix anim on mission start (should work on dedicated servers)
    [{
        params ["_unit"];
        if (_unit getVariable [QGVAR(isSurrendering), false] && {(vehicle _unit) == _unit}) then {
            //Adds an animation changed eh
            //If we get a change in animation then redo the animation (handles people vaulting to break the animation chain)
            local _animChangedEHID = _unit getVariable [QGVAR(surrenderAnimEHID), -1];
            if (_animChangedEHID != -1) then {
                TRACE_1("removing animChanged EH",_animChangedEHID);
                _unit removeEventHandler ["AnimChanged", _animChangedEHID];
            };
            _animChangedEHID = _unit addEventHandler ["AnimChanged", {
                params ["_unit", "_newAnimation"];
                if ((_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
                    TRACE_1("Surrender animation interrupted",_newAnimation);
                    [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);
                };
            }];
            _unit setVariable [QGVAR(surrenderAnimEHID), _animChangedEHID];
        };
    }, [_unit], 0.01] call EFUNC(common,waitAndExecute);
} else {
    _unit setVariable [QGVAR(isSurrendering), false, true];
    [_unit, QGVAR(Surrendered), false] call EFUNC(common,setCaptivityStatus);

    //remove AnimChanged EH
    local _animChangedEHID = _unit getVariable [QGVAR(surrenderAnimEHID), -1];
    _unit removeEventHandler ["AnimChanged", _animChangedEHID];
    _unit setVariable [QGVAR(surrenderAnimEHID), -1];

    if (_unit == ACE_player) then {
        //only re-enable HUD if not handcuffed
        if (!(_unit getVariable [QGVAR(isHandcuffed), false])) then {
            showHUD true;
        };
    };

    if (!alive _unit) exitWith {};
    if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};  //don't touch animations if unconscious

    //if we are in "hands up" animationState, crack it now
    if (((vehicle _unit) == _unit) && {(animationState _unit) == "ACE_AmovPercMstpSsurWnonDnon"}) then {
        [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    } else {
        //spin up a PFEH, to watching animationState for the next 20 seconds to make sure we don't enter "hands up"
        //Handles long animation chains
        [{
            params ["_args", "_pfID"];
            _args params ["_unit", "_maxTime"];
            //If waited long enough or they re-surrendered or they are unconscious, exit loop
            if ((ACE_time > _maxTime) || {_unit getVariable [QGVAR(isSurrendering), false]} || {_unit getVariable ["ACE_isUnconscious", false]}) exitWith {
                [_pfID] call CBA_fnc_removePerFrameHandler;
            };
            //Only break animation if they are actualy the "hands up" animation (because we are using switchmove there won't be an transition)
            if (((vehicle _unit) == _unit) && {(animationState _unit) == "ACE_AmovPercMstpSsurWnonDnon"}) exitWith {
                [_pfID] call CBA_fnc_removePerFrameHandler;
                //Break out of hands up animation loop
                [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
            };
        }, 0, [_unit, (ACE_time + 20)]] call CBA_fnc_addPerFrameHandler;
    };
};

//Global Event after changes:
["CaptiveStatusChanged", [_unit, _state, "SetSurrendered"]] call EFUNC(common,globalEvent);
