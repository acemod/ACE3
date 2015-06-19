#include "script_component.hpp"

#include "UI\defines\shared_defines.hpp"

// prevent execution of anything below on headless clients
if (!hasInterface) exitWith {};

// Get a rsc layer for for our displays
GVAR(rscLayer) = [QGVAR(displays)] call BIS_fnc_rscLayer;
GVAR(rscLayerMailNotification) = [QGVAR(mailNotification)] call BIS_fnc_rscLayer;

/*
Figure out the scaling factor based on the current map (island) being played
*/
GVAR(worldSize) = call {
    private ["_ctrlMap","_mapPos1","_mapPos2"];
    disableSerialization;
    _ctrlMap = finddisplay 12 displayctrl 51;
    if !(isNull _ctrlMap) then {
    	_mapPos1 = _ctrlMap ctrlmapscreentoworld [0,0];
    	_mapPos2 = _ctrlMap ctrlmapscreentoworld [1,0];
    	_mapPos1 set [2,0];  _mapPos2 set [2,0];
    	round ((_mapPos1 vectordistance _mapPos2) / ctrlmapscale _ctrlMap)
    } else {
    	// this will most likely only happen when we are loading a world while in ArmA main menu
    	// meaning we don't have to return the real value; 8192 is the default worldSize for Stratis and VR
    	8192
	};
};

// still need to figure out if this is really required and how I actually got to this number (too long ago!)
GVAR(mapScaleFactor) = GVAR(worldSize) / 2666.65;

// ifOpenStart will be set to true while interface is starting and prevent further open attempts
GVAR(ifOpenStart) = false;

// Initialize all uiNamespace variables
SETUVAR(GVAR(DK10_dlg), displayNull);
SETUVAR(GVAR(GD300_dsp), displayNull);
SETUVAR(GVAR(GD300_dlg), displayNull);
SETUVAR(GVAR(JV5_dlg), displayNull);
SETUVAR(GVAR(MicroDAGR_dsp), displayNull);
SETUVAR(GVAR(MicroDAGR_dlg), displayNull);
SETUVAR(GVAR(TAD_dsp), displayNull);
SETUVAR(GVAR(TAD_dlg), displayNull);

// Draw Map Tools (Hook)
GVAR(drawMapTools) = false;
GVAR(mapToolsArrowToCursor) = true;

// Base defines.
GVAR(uavViewActive) = false;
GVAR(uavCams) = [];
GVAR(cursorOnMap) = false;
GVAR(mapCursorPos) = [0,0];
GVAR(mapWorldPos) = [];
GVAR(mapScale) = 0.5;
GVAR(textAndIconScaleFactor) = 12;
GVAR(showBFTtext) = true;
GVAR(playerVehicleIcon) = "";

// Lists
GVAR(notificationCache) = [];

// Setup icon and text sizes
[] call FUNC(updateTextAndIconSize);

// List setup
GVAR(UAVlist) = [];
GVAR(Hcamlist) = [];

// Define default settings for interface property groups
GVAR(settings) = HASH_CREATE;

private ["_tempHash"];
// COMMON settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mode","BFT");
HASH_SET(_tempHash,"mapScaleMin",0.1);
HASH_SET(_tempHash,"mapScaleMax",2 ^ round(sqrt(GVAR(worldSize) / 1024)));
HASH_SET(GVAR(settings),"COMMON",_tempHash);

#include "initKeybinds.sqf"