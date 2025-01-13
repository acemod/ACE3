// by esteldunedain, LorenLuke

#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Init variables
GVAR(mapGpsShow) = true;
GVAR(mapGpsNextUpdate) = -1;
GVAR(lastDrawnLine) = "";

GVAR(mapTool_Shown) = 0;
GVAR(mapTool_pos) = [0, 0];
GVAR(mapTool_angle) = 0;
GVAR(mapTool_isDragging) = false;
GVAR(mapTool_isRotating) = false;
GVAR(mapTool_moveToMouse) = true;  // used to display it in center of screen when opened

GVAR(plottingBoard_Shown) = 0;
GVAR(plottingBoard_pos) = [0, 0];
GVAR(plottingBoard_angle) = 0;
GVAR(plottingBoard_acrylicAngle) = 0;
GVAR(plottingBoard_rulerAngle) = 0;
GVAR(plottingBoard_isDragging) = false;
GVAR(plottingBoard_isRotating) = -1;
GVAR(plottingBoard_moveToMouse) = true;  // used to display it in center of screen when opened
GVAR(plottingBoard_markers) = createHashMap;

// Install the event handers for the map tools on the main in-game map
[{
    !isNull findDisplay 12
}, {
    private _map = (findDisplay 12) displayCtrl 51;

    _map ctrlAddEventHandler ["MouseMoving", LINKFUNC(handleMouseMove)];
    _map ctrlAddEventHandler ["MouseButtonDown", {[1, _this] call FUNC(handleMouseButton);}];
    _map ctrlAddEventHandler ["MouseButtonUp", {[0, _this] call FUNC(handleMouseButton)}];
    _map ctrlAddEventHandler ["Draw", {call FUNC(updateMapToolMarkers); call FUNC(openMapGpsUpdate);}];
}, []] call CBA_fnc_waitUntilAndExecute;

["visibleMap", {
    params ["", "_mapOn"];
    if (!_mapOn) then {
        // Handle closing map in middle of line drawing (it's never created)
        GVAR(freedrawing) = false;
    };
}] call CBA_fnc_addPlayerEventHandler;

addMissionEventHandler ["MarkerCreated", {
    [_this, false] call FUNC(handlePlottingBoardMarkers);

    // Cache last user-drawn polyline marker
    private _marker = _this select 0;
    if ((markerPolyline _marker) isNotEqualTo []) then {
        GVAR(lastDrawnLine) = _marker;
    };
}];

addMissionEventHandler ["MarkerDeleted", {
    [[_this select 0, -1, objNull, _this select 1], true] call FUNC(handlePlottingBoardMarkers);
}];

GVAR(freeDrawingData) = [];
GVAR(freedrawing) = false;
