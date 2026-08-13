//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

//Add deviceKey entry:
private _conditonCode = {
    "ACE_microDAGR" in (ACE_player call EFUNC(common,uniqueItems))
};
private _toggleCode = {
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {};
    [] call FUNC(openDisplay); //toggle display mode
};
private _closeCode = {
    if (GVAR(currentShowMode) == DISPLAY_MODE_CLOSED) exitWith {};
    [DISPLAY_MODE_CLOSED] call FUNC(openDisplay);
};
[(localize LSTRING(itemName)), QPATHTOF(images\microDAGR_item.paa), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);

// Mode keybinds:
["ACE3 Equipment", QGVAR(previousMode), LLSTRING(previousMode), {
    private _newMode = GVAR(currentApplicationPage) - 1;
    if (_newMode < APP_MODE_INFODISPLAY) then {
        _newMode = APP_MODE_SETUP;
    };
    [_newMode] call FUNC(saveCurrentAndSetNewMode);
}, ""] call CBA_fnc_addKeybind;

["ACE3 Equipment", QGVAR(nextMode), LLSTRING(nextMode), {
    private _newMode = GVAR(currentApplicationPage) + 1;
    if (_newMode > APP_MODE_SETUP) then {
        _newMode = APP_MODE_INFODISPLAY;
    };
    [_newMode] call FUNC(saveCurrentAndSetNewMode);
}, ""] call CBA_fnc_addKeybind;

//Add Eventhandler:
[QEGVAR(vector,rangefinderData), LINKFUNC(recieveRangefinderData)] call CBA_fnc_addEventHandler;

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
GVAR(settingShowMagneticNorth) = false;

GVAR(newWaypointPosition) = [];
GVAR(currentWaypoint) = -1;
GVAR(rangeFinderPositionASL) = [];
GVAR(prevWaypointsCount) = 0;

GVAR(mgrsGridZoneDesignator) = format ["%1 %2",EGVAR(common,MGRS_data) select 0, EGVAR(common,MGRS_data) select 1];
