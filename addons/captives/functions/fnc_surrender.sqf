/*
 * Author: commy2 PabstMirror
 * Lets a unit surrender
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: State <BOOL>
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
    
    // fix anim on mission start (should work on dedicated servers)
    [{
        PARAMS_1(_unit);
        if (_unit getVariable [QGVAR(isSurrendering), false] && {vehicle _unit == _unit}) then {
            [_unit] call EFUNC(common,fixLoweredRifleAnimation);
            [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);
        };
    }, [_unit], 0.01, 0] call EFUNC(common,waitAndExecute);

    //Start up a pfeh to make sure the unit actualy goes into the animation
    //Only change variables and captivity when they reach that state 
    //fixes vaulting to break animation
    [{
        PARAMS_2(_args,_pfID);
        EXPLODE_2_PVT(_args,_unit,_maxTime);

        if (time > _maxTime) exitWith {
            [_pfID] call CBA_fnc_removePerFrameHandler;
            _unit setVariable [QGVAR(isSurrendering), false, true];
            ERROR("Surrender animation failed");
        };
        if ((animationState _unit) == "ACE_AmovPercMstpSsurWnonDnon") exitWith {
            [_pfID] call CBA_fnc_removePerFrameHandler;
             
            if (_unit == ACE_player) then {
                showHUD false;
            };
            [_unit, QGVAR(Surrendered), true] call EFUNC(common,setCaptivityStatus);
        };
    }, 0, [_unit, (time + 20)]] call CBA_fnc_addPerFrameHandler;
} else {
    _unit setVariable [QGVAR(isSurrendering), false, true];
    [_unit, QGVAR(Surrendered), false] call EFUNC(common,setCaptivityStatus);

    if ((vehicle _unit) == _unit) then {
        //Break out of hands up animation loop (doAnimation handles Unconscious prioity)
        [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    };

    if (_unit == ACE_player) then {
        //only re-enable HUD if not handcuffed
        if (!(_unit getVariable [QGVAR(isHandcuffed), false])) then {
            showHUD true;
        };
    };
};
