/*
 * Author: Nic547, commy2
 * Handcuffs a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to take captive, false to release captive <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, true] call ACE_captives_fnc_setHandcuffed;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_state);

// We only want this function to work on local machines
if (!local _unit) exitwith {
    [_this, QUOTE(FUNC(setHandcuffed)), _unit] call EFUNC(common,execRemoteFnc);
    TRACE_2("running setHandcuffed on remote unit",_unit,_state);
};

if (_state isEqualTo (_unit getVariable [QGVAR(isHandcuffed), false])) then {
    LOG("setHandcuffed: current state same as new");
};

if (_state) then {
    _unit setVariable [QGVAR(isHandcuffed), true, true];
    if (_unit getVariable [QGVAR(isSurrendering), false]) then {  //If surrendering, stop
        [_unit, _false] call FUNC(surrender);
    };
    [_unit, QGVAR(Handcuffed), true] call EFUNC(common,setCaptivityStatus);
    _unit setVariable [QGVAR(CargoIndex), ((vehicle _unit) getCargoIndex _unit), true];

    if (_unit == ACE_player) then {
        showHUD false;
    };

    // fix anim on mission start (should work on dedicated servers)
    [{
        PARAMS_1(_unit);
        if (_unit getVariable [QGVAR(isHandcuffed), false] && {vehicle _unit == _unit}) then {
            [_unit] call EFUNC(common,fixLoweredRifleAnimation);
            [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
        };
    }, [_unit], 0.01, 0] call EFUNC(common,waitAndExecute);
} else {
    _unit setVariable [QGVAR(isHandcuffed), false, true];
    [_unit, QGVAR(Handcuffed), false] call EFUNC(common,setCaptivityStatus);
    if ((vehicle _unit) == _unit) then {
        //Break out of hands up animation loop (doAnimation handles Unconscious prioity)
        [_unit, "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    };

    if (_unit getVariable [QGVAR(CargoIndex), -1] != -1) then {
        _unit setVariable [QGVAR(CargoIndex), -1, true];
    };

    if (_unit == ACE_player) then {
        showHUD true;
    };
};
