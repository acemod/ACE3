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

if (_state) then {
    if (_unit getVariable [QGVAR(isSurrendering), false]) exitWith {
        ERROR("Already Surrendering");
    };

    _unit setVariable [QGVAR(isSurrendering), true, true];
    [_unit, QGVAR(Surrendered), true] call EFUNC(common,setCaptivityStatus);
    [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);

    if (_unit == ACE_player) then {
        showHUD false;
    };

    private "_surrenderFnc";
    _surrenderFnc = {
        EXPLODE_1_PVT((_this select 0),_unit);

        if (_unit getVariable [QGVAR(isSurrendering), false]) then {
            if ((!alive _unit) || {_unit getVariable ["ACE_isUnconscious", false]} || {_unit getVariable [QGVAR(isHandcuffed), false]}) then {
                [_unit, false] call FUNC(surrender);
                [(_this select 1)] call cba_fnc_removePerFrameHandler;
            };
        } else {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
    };
    [_surrenderFnc, 0.0, [_unit]] call CBA_fnc_addPerFrameHandler;
} else {
    _unit setVariable [QGVAR(isSurrendering), false, true];

    if !(_unit getVariable ["ACE_isUnconscious", false]) then {
        //Break out of hands up animation loop
        //don't want to step on animations from medical (TODO: testing medical integration)
        [_unit, "ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    };

    [_unit, QGVAR(Surrendered), false] call EFUNC(common,setCaptivityStatus);

    if (_unit == ACE_player) then {
        //only enable if not handcuffed
        if (!(_unit getVariable [QGVAR(isHandcuffed), false])) then {
            showHUD true;
        };
    };
};
