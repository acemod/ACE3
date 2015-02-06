/*
 * Author: Nic547, commy2
 * Handcuffs a unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to take captive, false to release captive <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_state);


if (!local _unit) exitWith {
    ERROR("setHandcuffed unit not local");
};

if (_state isEqualTo (_unit getVariable [QGVAR(isHandcuffed), false])) exitWith {
    ERROR("new state equals current");
};

if (_state) then {
    _unit setVariable [QGVAR(isHandcuffed), true, true];

    // fix anim on mission start (should work on dedicated servers)
    _unit spawn {
        [_this, QGVAR(Handcuffed), true] call EFUNC(common,setCaptivityStatus);

        if (_this getVariable [QGVAR(isHandcuffed), false] && {vehicle _this == _this}) then {
            [_this] call EFUNC(common,fixLoweredRifleAnimation);
            [_this, "ACE_AmovPercMstpScapWnonDnon", 0] spawn EFUNC(common,doAnimation);
        };
    };

    _unit setVariable ["ACE_Captives_CargoIndex", vehicle _unit getCargoIndex _unit, true];

    if (_unit == ACE_player) then {
        showHUD false;
    };
} else {
    _unit setVariable [QGVAR(isHandcuffed), false, true];
    [_unit, QGVAR(Handcuffed), true] call EFUNC(common,setCaptivityStatus);
    if (vehicle _unit == _unit) then {
        [_unit, "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    };

    if (_unit getVariable ["ACE_Captives_CargoIndex", -1] != -1) then {
        _unit setVariable ["ACE_Captives_CargoIndex", -1, true];
    };

    if (_unit == ACE_player) then {
        showHUD true;
    };
};
