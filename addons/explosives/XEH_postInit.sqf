/*
 * Author: Garth 'L-H' de Wet
 * Initialises the player object for the explosive system.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

//Event for setting explosive placement angle/pitch:
[QGVAR(place), {_this call FUNC(setPosition)}] call CBA_fnc_addEventHandler;
[QGVAR(startDefuse), FUNC(startDefuse)] call CBA_fnc_addEventHandler;

//When getting knocked out in medical, trigger deadman explosives:
//Event is global, only run on server (ref: ace_medical_fnc_setUnconscious)
if (isServer) then {
    [QGVAR(detonate), {
        params ["_unit", "_explosive", "_delay"];
        TRACE_3("server detonate EH",_unit,_explosive,_delay);
        _explosive setShotParents [_unit, _unit];
        [{
            params ["_explosive"];
            TRACE_1("exploding",_explosive);
            if (!isNull _explosive) then {
                _explosive setDamage 1;
            };
        }, _explosive, _delay] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;

    ["ace_unconscious", {
        params ["_unit", "_isUnconscious"];
        if (!_isUnconscious) exitWith {};
        TRACE_1("Knocked Out, Doing Deadman", _unit);
        [_unit] call FUNC(onIncapacitated);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(sendOrientations), {
        params ["_logic"];
        TRACE_1("sendOrientations received:",_logic);
        // Filter the array before sending it
        GVAR(explosivesOrientations) = GVAR(explosivesOrientations) select {
            _x params ["_explosive"];
            (!isNull _explosive && {alive _explosive})
        };
        TRACE_1("orientationsSent sent:",GVAR(explosivesOrientations));
        [QGVAR(orientationsSent), [GVAR(explosivesOrientations)], _logic] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

GVAR(PlacedCount) = 0;
GVAR(Setup) = objNull;
GVAR(pfeh_running) = false;
GVAR(CurrentSpeedDial) = 0;

// In case we are a JIP client, ask the server for orientation of any previously
// placed mine.
if (didJIP) then {
    [QGVAR(orientationsSent), {
        params ["_explosivesOrientations"];
        TRACE_1("orientationsSent received:",_explosivesOrientations);
        {
            _x params ["_explosive","_direction","_pitch"];
            TRACE_3("orientation set:",_explosive,_direction,_pitch);
            [_explosive, _direction, _pitch] call FUNC(setPosition);
        } forEach _explosivesOrientations;
        deleteVehicle GVAR(localLogic);
        GVAR(localLogic) = nil;
    }] call CBA_fnc_addEventHandler;

    //  Create a logic to get the client ID
    GVAR(localLogic) = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    TRACE_1("sendOrientations sent:",GVAR(localLogic));
    [QGVAR(sendOrientations), [GVAR(localLogic)]] call CBA_fnc_serverEvent;
};

["ace_interactMenuOpened", {
    //Cancel placement if interact menu opened
    if (GVAR(pfeh_running)) then {
        GVAR(placeAction) = PLACE_CANCEL;
    };

    //Show defuse actions on CfgAmmos (allMines):
    _this call FUNC(interactEH);

}] call CBA_fnc_addEventHandler;
