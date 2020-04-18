// by esteldunedain

#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Init variables
GVAR(mapGpsShow) = true;
GVAR(mapGpsNextUpdate) = -1;

GVAR(mapTool_Shown) = 0;
GVAR(mapTool_pos) = [0,0];
GVAR(mapTool_angle) = 0;
GVAR(mapTool_isDragging) = false;
GVAR(mapTool_isRotating) = false;

//Install the event handers for the map tools on the main in-game map
["Draw", {call FUNC(updateMapToolMarkers); call FUNC(openMapGpsUpdate);}, true] call EFUNC(common,addMapEventHandler);
["MouseMoving", {call FUNC(handleMouseMove);}, true] call EFUNC(common,addMapEventHandler);
["MouseButtonDown", {[1, _this] call FUNC(handleMouseButton);}, true] call EFUNC(common,addMapEventHandler);
["MouseButtonUp", {[0, _this] call FUNC(handleMouseButton)}, true] call EFUNC(common,addMapEventHandler);

["visibleMap", {
    params ["", "_mapOn"];
    if (!_mapOn) then {
        // Handle closing map in middle of line drawing (it's never created)
        GVAR(freedrawing) = false;
    };
}] call CBA_fnc_addPlayerEventHandler;


GVAR(freeDrawingData) = [];
GVAR(freedrawing) = false;
