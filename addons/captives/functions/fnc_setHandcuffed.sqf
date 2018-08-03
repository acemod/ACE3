/*
 * Author: Nic547, commy2
 * Handcuffs a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to take captive, false to release captive <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ACE_captives_fnc_setHandcuffed;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_state"];
TRACE_2("params",_unit,_state);

if (!local _unit) exitWith {
    WARNING("running setHandcuffed on remote unit");
};

if !(missionNamespace getVariable [QGVAR(captivityEnabled), false]) exitWith {
    // It's to soon to call this function, delay it
    if (EGVAR(common,settingsInitFinished)) then {
        // Settings are already initialized, but the small wait isn't over
        [DFUNC(setHandCuffed), _this, 0.05] call CBA_fnc_waitAndExecute;
    } else {
        // Settings are not initialized yet
        [DFUNC(setHandCuffed), _this] call EFUNC(common,runAfterSettingsInit);
    };
};

if ((_unit getVariable [QGVAR(isHandcuffed), false]) isEqualTo _state) exitWith {
    WARNING("setHandcuffed: current state same as new");
};

if (_state) then {
    _unit setVariable [QGVAR(isHandcuffed), true, true];
    [_unit, "setCaptive", QGVAR(Handcuffed), true] call EFUNC(common,statusEffect_set);

    if (_unit getVariable [QGVAR(isSurrendering), false]) then {  //If surrendering, stop
        [_unit, false] call FUNC(setSurrendered);
    };

    //Set unit cargoIndex (will be -1 if dismounted)
    _unit setVariable [QGVAR(CargoIndex), ((vehicle _unit) getCargoIndex _unit), true];

    if (_unit == ACE_player) then {
        ["captive", [false, false, false, false, false, false, false, false, false, true]] call EFUNC(common,showHud);
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
        private _animChangedEHID = _unit getVariable [QGVAR(handcuffAnimEHID), -1];
        if (_animChangedEHID != -1) then {
            TRACE_1("removing animChanged EH",_animChangedEHID);
            _unit removeEventHandler ["AnimChanged", _animChangedEHID];
        };
        _animChangedEHID = _unit addEventHandler ["AnimChanged", {call FUNC(handleAnimChangedHandcuffed)}];
        TRACE_2("Adding animChangedEH",_unit,_animChangedEHID);
        _unit setVariable [QGVAR(handcuffAnimEHID), _animChangedEHID];

    }, [_unit], 0.01] call CBA_fnc_waitAndExecute;
} else {
    _unit setVariable [QGVAR(isHandcuffed), false, true];
    [_unit, "setCaptive", QGVAR(Handcuffed), false] call EFUNC(common,statusEffect_set);

    //remove AnimChanged EH
    private _animChangedEHID = _unit getVariable [QGVAR(handcuffAnimEHID), -1];
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
        ["captive", []] call EFUNC(common,showHud); //same as showHud true;
    };
};

//Global Event after changes:
["ace_captiveStatusChanged", [_unit, _state, "SetHandcuffed"]] call CBA_fnc_globalEvent;
