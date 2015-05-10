//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

//Add Keybinds:
["ACE3 Equipment", QGVAR(openGPS), (localize "STR_ACE_microdagr_toggleUnit"),
{
    // canInteractWith (can use on map)
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (!("ACE_microDAGR" in (items ace_player))) exitWith {false};

    [] call FUNC(openDisplay); //toggle display mode
    true;
},
{false},
[0xC7, [false, false, false]], false] call cba_fnc_addKeybind;  //Home Key

["ACE3 Equipment", QGVAR(closeGPS), (localize "STR_ACE_microdagr_closeUnit"),
{
    // canInteractWith (can use on map)
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (!("ACE_microDAGR" in (items ace_player))) exitWith {false};
    if (GVAR(currentShowMode) == DISPLAY_MODE_CLOSED) exitWith {false};

    [DISPLAY_MODE_CLOSED] call FUNC(openDisplay); //close unit
    true;
},
{false},
[0xC7, [false, true, false]], false] call cba_fnc_addKeybind;  //CTRL + Home Key

//Add Eventhandler:
["RangerfinderData", {_this call FUNC(recieveRangefinderData)}] call EFUNC(common,addEventHandler);

//Global Variables to default:
GVAR(gpsPositionASL) = [0,0,0];
GVAR(mapAutoTrackPosition) = true;
GVAR(mapShowTexture) = false;
GVAR(mapPosition) = [-999, -999];
GVAR(mapZoom) = 0.075;
GVAR(currentApplicationPage) = APP_MODE_NULL;
GVAR(currentShowMode) = DISPLAY_MODE_CLOSED;

//User Settings
GVAR(settingUseMils) = false;
GVAR(settingShowAllWaypointsOnMap) = true;

GVAR(newWaypointPosition) = [];
GVAR(currentWaypoint) = -1;
GVAR(rangeFinderPositionASL) = [];


GVAR(mapAltitude) = getNumber (configFile >> "CfgWorlds" >> worldName >> "elevationOffset");

GVAR(mgrsGridZoneDesignator) = format ["%1 %2",EGVAR(map,MGRS_data) select 0, EGVAR(map,MGRS_data) select 1];

