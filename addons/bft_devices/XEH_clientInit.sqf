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
call {
    private ["_ctrlMap","_mapPos1","_mapPos2","_mapSize"];
    _ctrlMap = finddisplay 12 displayctrl 51;
    _mapPos1 = _ctrlMap ctrlmapscreentoworld [0,0];
    _mapPos2 = _ctrlMap ctrlmapscreentoworld [1,0];
    _mapPos1 set [2,0];  _mapPos2 set [2,0];
    _mapSize = round ((_mapPos1 vectordistance _mapPos2) / ctrlmapscale _ctrlMap);
    GVAR(worldSize) = _mapSize;
    GVAR(mapScaleFactor) = _mapSize / 2666.65;
};

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
GVAR(UAVlist) = [];
GVAR(Hcamlist) = [];

// Define interfaces that share the same property group
GVAR(displayPropertyGroups) = HASH_CREATE;
HASH_SET(GVAR(displayPropertyGroups),QGVAR(DK10_dlg),"DK10");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(GD300_dlg),"GD300");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(GD300_dsp),"GD300");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(JV5_dlg),"JV5");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(TAD_dsp),"TAD");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(TAD_dlg),"TAD");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(MicroDAGR_dsp),"MicroDAGR");
HASH_SET(GVAR(displayPropertyGroups),QGVAR(MicroDAGR_dlg),"MicroDAGR");

// Define default settings for interface property groups
GVAR(settings) = HASH_CREATE;

// COMMON settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mode","BFT");
HASH_SET(_tempHash,"mapScaleMin",0.1);
HASH_SET(_tempHash,"mapScaleMax",2 ^ round(sqrt(GVAR(worldSize) / 1024)));
HASH_SET(GVAR(settings),"COMMON",_tempHash);

// DK10 settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mode","DESKTOP");
HASH_SET(_tempHash,"showIconText",true);
HASH_SET(_tempHash,"mapWorldPos",[]);
HASH_SET(_tempHash,"mapScaleDsp",2);
HASH_SET(_tempHash,"mapScaleDlg",2);
_tempMapHash = HASH_CREATE;
HASH_SET(_tempMapHash,"SAT",IDC_SCREEN);
HASH_SET(_tempMapHash,"TOPO",IDC_SCREEN_TOPO);
HASH_SET(_tempHash,"mapTypes",_tempMapHash);
HASH_SET(_tempHash,"mapType","SAT");
HASH_SET(_tempHash,"uavCam","");
HASH_SET(_tempHash,"hCam","");
HASH_SET(_tempHash,"mapTools",true);
HASH_SET(GVAR(settings),"DK10",_tempHash);

// GD300 settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mode","BFT");
HASH_SET(_tempHash,"showIconText",true);
HASH_SET(_tempHash,"mapWorldPos",[]);
HASH_SET(_tempHash,"mapScaleDsp",0.4);
HASH_SET(_tempHash,"mapScaleDlg",0.4);
_tempMapHash = HASH_CREATE;
HASH_SET(_tempMapHash,"SAT",IDC_SCREEN);
HASH_SET(_tempMapHash,"TOPO",IDC_SCREEN_TOPO);
HASH_SET(_tempHash,"mapTypes",_tempMapHash);
HASH_SET(_tempHash,"mapType","SAT");
HASH_SET(_tempHash,"showMenu",false);
HASH_SET(_tempHash,"mapTools",true);
HASH_SET(_tempHash,"nightMode",2);
HASH_SET(_tempHash,"brightness",0.9);
HASH_SET(GVAR(settings),"GD300",_tempHash);

// JV5 settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mapWorldPos",[]);
HASH_SET(_tempHash,"showIconText",true);
HASH_SET(_tempHash,"mapScaleDsp",2);
HASH_SET(_tempHash,"mapScaleDlg",2);
_tempMapHash = HASH_CREATE;
HASH_SET(_tempMapHash,"SAT",IDC_SCREEN);
HASH_SET(_tempMapHash,"TOPO",IDC_SCREEN_TOPO);
HASH_SET(_tempHash,"mapTypes",_tempMapHash);
HASH_SET(_tempHash,"mapType","SAT");
HASH_SET(_tempHash,"mapTools",true);
HASH_SET(GVAR(settings),"JV5",_tempHash);

// TAD settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mapWorldPos",[]);
HASH_SET(_tempHash,"showIconText",true);
HASH_SET(_tempHash,"mapScaleDsp",2);
HASH_SET(_tempHash,"mapScaleDlg",2);
HASH_SET(_tempHash,"mapScaleMin",1);
_tempMapHash = HASH_CREATE;
HASH_SET(_tempMapHash,"SAT",IDC_SCREEN);
HASH_SET(_tempMapHash,"TOPO",IDC_SCREEN_TOPO);
HASH_SET(_tempMapHash,"BLK",IDC_SCREEN_BLACK);
HASH_SET(_tempHash,"mapTypes",_tempMapHash);
HASH_SET(_tempHash,"mapType","SAT");
HASH_SET(_tempHash,"mapTools",true);
HASH_SET(_tempHash,"nightMode",0);
HASH_SET(_tempHash,"brightness",0.8);
HASH_SET(GVAR(settings),"TAD",_tempHash);

// MicroDAGR settings
_tempHash = HASH_CREATE;
HASH_SET(_tempHash,"mapWorldPos",[]);
HASH_SET(_tempHash,"showIconText",true);
HASH_SET(_tempHash,"mapScaleDsp",0.4);
HASH_SET(_tempHash,"mapScaleDlg",0.4);
_tempMapHash = HASH_CREATE;
HASH_SET(_tempMapHash,"SAT",IDC_SCREEN);
HASH_SET(_tempMapHash,"TOPO",IDC_SCREEN_TOPO);
HASH_SET(_tempHash,"mapTypes",_tempMapHash);
HASH_SET(_tempHash,"mapType","SAT");
HASH_SET(_tempHash,"mapTools",true);
HASH_SET(_tempHash,"nightMode",2);
HASH_SET(_tempHash,"brightness",0.9);
HASH_SET(GVAR(settings),"MicroDAGR",_tempHash);

#include "initKeybinds.sqf"