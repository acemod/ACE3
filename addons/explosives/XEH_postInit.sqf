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

if (isServer) then {
    //Event is global, only run on server (ref: ace_medical_fnc_setUnconscious)
    ["medical_onUnconscious", {
        params ["_unit", "_isUnconscious"];
        if (!_isUnconscious) exitWith {};
        TRACE_1("Knocked Out, Doing Deadman", _unit);
        [_unit] call FUNC(onIncapacitated);
    }] call EFUNC(common,addEventHandler);
};

if !(hasInterface) exitWith {};

GVAR(PlacedCount) = 0;
GVAR(Setup) = objNull;
GVAR(pfeh_running) = false;
GVAR(CurrentSpeedDial) = 0;


["interactMenuOpened", {
    //Cancel placement if interact menu opened
    if (GVAR(pfeh_running)) then {
        GVAR(placeAction) = PLACE_CANCEL;
    };

    //Show defuse actions on cfgAmmos (allMines):
    _this call FUNC(interactEH);

}] call EFUNC(common,addEventHandler);

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(common,addScrollWheelEventHandler);
