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

//Start up a PFEH that scans all mines/explosives without defuseObjects attached and adds them
//Handles Editor Placed / Zeus / Scripted
if (isServer) then {
    [{
        private ["_explosive", "_helpers", "_defuseHelper"];
        {
            _explosive = _x;
            _helpers = {
                ((typeOf _x) == "ACE_DefuseObject") && {(_x getVariable [QGVAR(Explosive), objNull]) == _explosive}
            } count (attachedObjects _explosive);

            if (_helpers == 0) then {
                TRACE_3("Explosive without helper",_explosive,(getPosAsl _explosive),(typeOf _explosive));
                _defuseHelper = createVehicle ["ACE_DefuseObject", (getPos _explosive), [], 0, "NONE"];
                _defuseHelper attachTo [_explosive, [0,0,0], ""];
                _defuseHelper setVariable [QGVAR(Explosive),_explosive,true];
            };
        } forEach allMines;
    }, 5, []] call CBA_fnc_addPerFrameHandler;
};

if !(hasInterface) exitWith {};
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
