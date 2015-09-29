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
TRACE_2("params",_unit,_state);

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
        if (!(_unit getVariable [QGVAR(isHandcuffed), false])) exitWith {};

        if ((vehicle _unit) == _unit) then {
            [_unit] call EFUNC(common,fixLoweredRifleAnimation);
            [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
        } else {
            [_unit, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
            [_unit, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
        };

        //Adds an animation changed eh
        //If we get a change in animation then redo the animation (handles people vaulting to break the animation chain)
        private "_animChangedEHID";

        _animChangedEHID = _unit addEventHandler ["AnimChanged", {
            params ["_unit", "_newAnimation"];
            TRACE_2("AnimChanged",_unit,_newAnimation);
            if (_unit == (vehicle _unit)) then {
                if ((_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
                    TRACE_1("Handcuff animation interrupted",_newAnimation);
                    [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
                };
            } else {

                _turretPath = [];
                {
                    _x params ["_xUnit", "", "", "_xTurretPath"];
                    if (_unit == _xUnit) exitWith {_turretPath = _xTurretPath};
                } forEach (fullCrew (vehicle _unit));
                TRACE_1("turret Path",_turretPath);
                if (_turretPath isEqualTo []) exitWith {};

                TRACE_1("Handcuff (FFV) animation interrupted",_newAnimation);
                [_unit, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
                [_unit, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
            };
        }];
        TRACE_2("Adding animChangedEH",_unit,_animChangedEHID);
        _unit setVariable [QGVAR(handcuffAnimEHID), _animChangedEHID];

    }, [_unit], 0.01] call EFUNC(common,waitAndExecute);
} else {
    _unit setVariable [QGVAR(isHandcuffed), false, true];
    [_unit, QGVAR(Handcuffed), false] call EFUNC(common,setCaptivityStatus);

    //remove AnimChanged EH
    private "_animChangedEHID";
    _animChangedEHID = _unit getVariable [QGVAR(handcuffAnimEHID), -1];
    TRACE_1("removing animChanged EH",_animChangedEHID);
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

//Global Event after changes:
["CaptiveStatusChange", [_unit, _state, "SetHandcuffed"]] call EFUNC(common,globalEvent);
