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
    ["clientRequestsOrientations", {
        params ["_logic"];
        TRACE_1("clientRequestsOrientations received:",_logic);
        // Filter the array before sending it
        GVAR(explosivesOrientations) = GVAR(explosivesOrientations) select {
            _x params ["_explosive"];
            (!isNull _explosive && {alive _explosive})
        };
        TRACE_1("serverSendsOrientations sent:",GVAR(explosivesOrientations));
        ["serverSendsOrientations", _logic, [GVAR(explosivesOrientations)]] call EFUNC(common,targetEvent);
    }] call EFUNC(common,addEventHandler);
} else {
    ["serverSendsOrientations", {
        params ["_explosivesOrientations"];
        TRACE_1("serverSendsOrientations received:",_explosivesOrientations);
        {
            _x params ["_explosive","_direction","_pitch"];
            TRACE_3("orientation set:",_explosive,_direction,_pitch);
            [_explosive, _direction, _pitch] call FUNC(setPosition);
        } forEach _explosivesOrientations;
        private _group = group GVAR(localLogic);
        deleteVehicle GVAR(localLogic);
        GVAR(localLogic) = nil;
        deleteGroup _group;
    }] call EFUNC(common,addEventHandler);

    //  Create a logic to get the client ID
    GVAR(localLogic) = (createGroup sideLogic) createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    TRACE_1("clientRequestsOrientations sent:",GVAR(localLogic));
    ["clientRequestsOrientations", [GVAR(localLogic)]] call EFUNC(common,serverEvent);
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
