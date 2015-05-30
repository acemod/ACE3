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

if !(hasInterface) exitWith {};

["interactMenuOpened", {_this call FUNC(interactEH)}] call EFUNC(common,addEventHandler);

GVAR(PlacedCount) = 0;
GVAR(Setup) = objNull;
GVAR(pfeh_running) = false;
GVAR(CurrentSpeedDial) = 0;

//Cancel placement if interact menu opened
["interactMenuOpened", {
    if (GVAR(pfeh_running) && {!isNull (GVAR(Setup))}) then {
        call FUNC(place_Cancel)
    };
}] call EFUNC(common,addEventHandler);

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(Common,addScrollWheelEventHandler);
