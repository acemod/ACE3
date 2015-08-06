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

params ["_unit","_state"];

if (!local _unit) exitwith {
    ERROR("running setHandcuffed on remote unit");
};
if ((_unit getVariable [QGVAR(isHandcuffed), false]) isEqualTo _state) exitWith {
    ERROR("setHandcuffed: current state same as new");
};

if (_state) then {
    _unit setVariable [QGVAR(isHandcuffed), true, true];
    [_unit, QGVAR(Handcuffed), true] call EFUNC(common,setCaptivityStatus);

    if (_unit getVariable [QGVAR(isSurrendering), false]) then {  //If surrendering, stop
        [_unit, false] call FUNC(setSurrendered);
    };

    //Set unit cargoIndex (will be -1 if dismounted)
    _unit setVariable [QGVAR(CargoIndex), ((vehicle _unit) getCargoIndex _unit), true];

    if (_unit == ACE_player) then {
        showHUD false;
    };

    // fix anim on mission start (should work on dedicated servers)
    [{
        params ["_unit"];
        if (_unit getVariable [QGVAR(isHandcuffed), false] && {vehicle _unit == _unit}) then {
            [_unit] call EFUNC(common,fixLoweredRifleAnimation);
            [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);

            //Adds an animation changed eh
            //If we get a change in animation then redo the animation (handles people vaulting to break the animation chain)
            private "_animChangedEHID";
            _animChangedEHID = _unit addEventHandler ["AnimChanged", {
                PARAMS_2(_unit,_newAnimation);
                if ((_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
                    TRACE_1("Handcuff animation interrupted",_newAnimation);
                    [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
                };
            }];
            _unit setVariable [QGVAR(handcuffAnimEHID), _animChangedEHID];

        };
    }, [_unit], 0.01, 0] call EFUNC(common,waitAndExecute);
} else {
    _unit setVariable [QGVAR(isHandcuffed), false, true];
    [_unit, QGVAR(Handcuffed), false] call EFUNC(common,setCaptivityStatus);

    //remove AnimChanged EH
    private "_animChangedEHID";
    _animChangedEHID = _unit getVariable [QGVAR(handcuffAnimEHID), -1];
    _unit removeEventHandler ["AnimChanged", _animChangedEHID];
    _unit setVariable [QGVAR(handcuffAnimEHID), -1];

    if (((vehicle _unit) == _unit) && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
        //Break out of hands up animation loop
        [_unit, "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    };

    if (_unit getVariable [QGVAR(CargoIndex), -1] != -1) then {
        _unit setVariable [QGVAR(CargoIndex), -1, true];
    };

    if (_unit == ACE_player) then {
        showHUD true;
    };
};
