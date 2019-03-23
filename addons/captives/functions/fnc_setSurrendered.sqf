#include "script_component.hpp"
/*
 * Author: commy2 PabstMirror
 * Lets a unit surrender
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to surrender, false to un-surrender <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Pierre, true] call ACE_captives_fnc_setSurrendered;
 *
 * Public: No
 */

params ["_unit","_state"];
TRACE_2("params",_unit,_state);

if (!local _unit) exitWith {
    WARNING("running surrender on remote unit");
};

if !(missionNamespace getVariable [QGVAR(captivityEnabled), false]) exitWith {
    // It's to soon to call this function, delay it
    if (EGVAR(common,settingsInitFinished)) then {
        // Settings are already initialized, but the small wait isn't over
        [DFUNC(setSurrendered), _this, 0.05] call CBA_fnc_waitAndExecute;
    } else {
        // Settings are not initialized yet
        [DFUNC(setSurrendered), _this] call EFUNC(common,runAfterSettingsInit);
    };
};

if ((_unit getVariable [QGVAR(isSurrendering), false]) isEqualTo _state) exitWith {
    WARNING("Surrender: current state same as new");
};

if (_state) then {
    if ((vehicle _unit) != _unit) exitWith {WARNING("Cannot surrender while mounted");};
    if (_unit getVariable [QGVAR(isHandcuffed), false]) exitWith {WARNING("Cannot surrender while handcuffed");};

    _unit setVariable [QGVAR(isSurrendering), true, true];

    [_unit, "setCaptive", QGVAR(Surrendered), true] call EFUNC(common,statusEffect_set);

    if (_unit == ACE_player) then {
        ["captive", [false, false, false, false, false, false, false, false, false, true]] call EFUNC(common,showHud);
    };

    [_unit] call EFUNC(common,fixLoweredRifleAnimation);
    [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);

    // fix anim on mission start (should work on dedicated servers)
    [{
        params ["_unit"];
        if (_unit getVariable [QGVAR(isSurrendering), false] && {(vehicle _unit) == _unit}) then {
            //Adds an animation changed eh
            //If we get a change in animation then redo the animation (handles people vaulting to break the animation chain)
            private _animChangedEHID = _unit getVariable [QGVAR(surrenderAnimEHID), -1];
            if (_animChangedEHID != -1) then {
                TRACE_1("removing animChanged EH",_animChangedEHID);
                _unit removeEventHandler ["AnimChanged", _animChangedEHID];
            };
            _animChangedEHID = _unit addEventHandler ["AnimChanged", {call FUNC(handleAnimChangedSurrendered)}];
            _unit setVariable [QGVAR(surrenderAnimEHID), _animChangedEHID];
        };
    }, [_unit], 0.01] call CBA_fnc_waitAndExecute;
} else {
    _unit setVariable [QGVAR(isSurrendering), false, true];
    [_unit, "setCaptive", QGVAR(Surrendered), false] call EFUNC(common,statusEffect_set);

    //remove AnimChanged EH
    private _animChangedEHID = _unit getVariable [QGVAR(surrenderAnimEHID), -1];
    _unit removeEventHandler ["AnimChanged", _animChangedEHID];
    _unit setVariable [QGVAR(surrenderAnimEHID), -1];

    if (_unit == ACE_player) then {
        //only re-enable HUD if not handcuffed
        if (!(_unit getVariable [QGVAR(isHandcuffed), false])) then {
            ["captive", []] call EFUNC(common,showHud); //same as showHud true;
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
            if ((CBA_missionTime > _maxTime) || {_unit getVariable [QGVAR(isSurrendering), false]} || {_unit getVariable ["ACE_isUnconscious", false]}) exitWith {
                [_pfID] call CBA_fnc_removePerFrameHandler;
            };
            //Only break animation if they are actualy the "hands up" animation (because we are using switchmove there won't be an transition)
            if (((vehicle _unit) == _unit) && {(animationState _unit) == "ACE_AmovPercMstpSsurWnonDnon"}) exitWith {
                [_pfID] call CBA_fnc_removePerFrameHandler;
                //Break out of hands up animation loop
                [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
            };
        }, 0, [_unit, (CBA_missionTime + 20)]] call CBA_fnc_addPerFrameHandler;
    };
};

//Global Event after changes:
["ace_captiveStatusChanged", [_unit, _state, "SetSurrendered"]] call CBA_fnc_globalEvent;
