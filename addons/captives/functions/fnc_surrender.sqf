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
    }, [_unit], 0.01, 0] call EFUNC(common,waitAndExecute);

    //PFEH - (TODO: move to event system?)
    [{
        EXPLODE_1_PVT((_this select 0),_unit);
        if (_unit getVariable [QGVAR(isSurrendering), false]) then {
            //If unit dies, gets knocked out, or is handcuffed then end surrender
            if ((!alive _unit) || {_unit getVariable ["ACE_isUnconscious", false]} || {_unit getVariable [QGVAR(isHandcuffed), false]}) then {
                [_unit, false] call FUNC(surrender);
                [(_this select 1)] call CBA_fnc_removePerFrameHandler;
            };
        } else {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
    }, 0.0, [_unit]] call CBA_fnc_addPerFrameHandler;
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
