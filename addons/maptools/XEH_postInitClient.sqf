// by esteldunedain

#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Init variables
GVAR(mapGpsShow) = true;

GVAR(mapTool_Shown) = 0;
GVAR(mapTool_pos) = [0,0];
GVAR(mapTool_angle) = 0;
GVAR(mapTool_isDragging) = false;
GVAR(mapTool_isRotating) = false;

//Install the event handers for the map tools on the main in-game map
[{!isNull findDisplay 12},
{
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {_this call FUNC(handleMouseMove);}];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", {[1, _this] call FUNC(handleMouseButton);}];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonUp", {[0, _this] call FUNC(handleMouseButton)}];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(updateMapToolMarkers);}];
}, []] call CBA_fnc_waitUntilAndExecute;

["visibleMap", {
    params ["", "_mapOn"];
    if (_mapOn) then {
        // Show GPS if required
        [GVAR(mapGpsShow)] call FUNC(openMapGps);
    } else {
        // Hide GPS
        [false] call FUNC(openMapGps);

        // Handle closing map in middle of line drawing (it's never created)
        GVAR(freedrawing) = false;
    };
}] call CBA_fnc_addPlayerEventHandler;


GVAR(freeDrawingData) = [];
GVAR(freedrawing) = false;

