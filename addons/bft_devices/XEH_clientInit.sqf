#include "script_component.hpp"

#include "UI\defines\shared_defines.hpp"

// prevent execution of anything below on headless clients
if (!hasInterface) exitWith {};

// Get a rsc layer for for our displays
GVAR(rscLayer) = [QGVAR(displays)] call BIS_fnc_rscLayer;
GVAR(rscLayerMailNotification) = [QGVAR(mailNotification)] call BIS_fnc_rscLayer;

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

// Setup icon and text sizes
[] call FUNC(updateTextAndIconSize);

// List setup
GVAR(notificationCache) = [];
GVAR(UAVlist) = [];
GVAR(hCamList) = [];

// Define default settings for interface property groups
GVAR(settings) = HASH_CREATE;

private ["_tempHash"];
// COMMON settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mode","BFT");
HASH_SET(_tempHash,"mapScaleMin",0.1);
HASH_SET(_tempHash,"mapScaleMax",2 ^ round(sqrt(GVAR(worldSize) / 1024)));
HASH_SET(GVAR(settings),"COMMON",_tempHash);

// when main map is opened, close any open interface
["mapOpened",{
    [] call FUNC(ifClose);
}] call EFUNC(common,addEventHandler);

#include "initKeybinds.sqf"