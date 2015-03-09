//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

//Add Keybinds:
["ACE3", QGVAR(openGPS), "Open GPS",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if (!("ACE_microDAGR" in (items ace_player))) exitWith {false};

    systemChat "Toggle Button Press";
    [] call FUNC(openDisplay);
    true;
},
{false},
[0xC7, [false, false, false]], false] call cba_fnc_addKeybind;  //Home Key

["ACE3", QGVAR(closeGpS), "Close GPS",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if (!("ACE_microDAGR" in (items ace_player))) exitWith {false};

    systemChat "Close Button Press";
    [DISPLAY_MODE_CLOSED] call FUNC(openDisplay);
    true;
},
{false},
[0xC7, [false, true, false]], false] call cba_fnc_addKeybind;  //CTRL + Home Key

//Add Eventhandler:
["RangerfinderData", {_this call FUNC(recieveRangefinderData)}] call EFUNC(common,addEventHandler);

//Global Variables to default:
GVAR(mapAutoTrackPosition) = true;
GVAR(mapShowTexture) = false;
GVAR(mapPosition) = [-999, -999];
GVAR(mapZoom) = 0.075;
GVAR(currentApplicationPage) = APP_MODE_NULL;
GVAR(currentShowMode) = DISPLAY_MODE_CLOSED;

GVAR(newWaypointPosition) = [];
GVAR(currentWaypoint) = -1;
GVAR(rangeFinderPositionASL) = [];


GVAR(mapAltitude) = getNumber (configFile >> "CfgWorlds" >> worldName >> "elevationOffset");

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

