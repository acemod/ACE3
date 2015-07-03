//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    ("ACE_microDAGR" in (items ACE_player))
};
_toggleCode = {
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {};
    [] call FUNC(openDisplay); //toggle display mode
};
_closeCode = {
    if (GVAR(currentShowMode) == DISPLAY_MODE_CLOSED) exitWith {};
    [DISPLAY_MODE_CLOSED] call FUNC(openDisplay);
};
[(localize LSTRING(itemName)), QUOTE(PATHTOF(images\microDAGR_item.paa)), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);


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

private ["_worldMapLong", "_worldMapLat", "_zone", "_band", "_squareID"];

//Calculate the map's MGRS:
_worldMapLong = getNumber (configFile >> "CfgWorlds" >> worldName >> "longitude");
_worldMapLat = getNumber (configFile >> "CfgWorlds" >> worldName >> "latitude");
//Pull UTM grid from world's long/lat
_zone = 1 + (floor ((_worldMapLong + 180) / 6));
_band = "Z";
if (_worldMapLat <= -80) then {
    _band = "A";
} else {
    if (_worldMapLat < 84) then {
        _band = "CDEFGHJKLMNPQRSTUVWXX" select [(floor ((_worldMapLat / 8) + 10)), 1];
    };
};
//calculating square ID from long/lat is a pain in the ass, just fake it unless someone wants to actualy do this
_squareID = if ((count worldName) > 2) then {toUpper(worldName select [0,2])} else {"XG"};
GVAR(mgrsGridZoneDesignator) = format ["%1%2 %3", _zone, _band, _squareID];

