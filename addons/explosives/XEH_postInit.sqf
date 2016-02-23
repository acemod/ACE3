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
[QGVAR(place), {_this call FUNC(setPosition)}] call EFUNC(common,addEventHandler);

//When getting knocked out in medical, trigger deadman explosives:
//Event is global, only run on server (ref: ace_medical_fnc_setUnconscious)
if (isServer) then {
    ["medical_onUnconscious", {
        params ["_unit", "_isUnconscious"];
        if (!_isUnconscious) exitWith {};
        TRACE_1("Knocked Out, Doing Deadman", _unit);
        [_unit] call FUNC(onIncapacitated);
    }] call EFUNC(common,addEventHandler);
};

if (!hasInterface) exitWith {};

GVAR(PlacedCount) = 0;
GVAR(Setup) = objNull;
GVAR(pfeh_running) = false;
GVAR(CurrentSpeedDial) = 0;

// In case we are a JIP client, ask the server for orientation of any previously
// placed mine.
if (isServer) then {
    ["clientRequestsOrientation", {
        params ["_logic"];
        ["serverSendsOrientations", _logic, GVAR(explosivesOrientations)] call EFUNC(common,targetEvent);
    }] call EFUNC(common,addEventHandler);
} else {
    ["serverSendsOrientations", {
        params ["_explosivesOrientations"];
        {
            params ["_explosive","_direction","_pitch"];
            [_explosive, _direction, _pitch] call FUNC(setPosition);
        } forEach _explosivesOrientations;
    }] call EFUNC(common,addEventHandler);

    //  Create a local logic to use a client ID
    private _logic = createGroup sideLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    ["clientRequestsOrientations", [_logic]] call EFUNC(common,serverEvent);
};

["interactMenuOpened", {
    //Cancel placement if interact menu opened
    if (GVAR(pfeh_running)) then {
        GVAR(placeAction) = PLACE_CANCEL;
    };

    //Show defuse actions on CfgAmmos (allMines):
    _this call FUNC(interactEH);

}] call EFUNC(common,addEventHandler);

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(common,addScrollWheelEventHandler);
