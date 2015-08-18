// by esteldunedain

#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Init variables
GVAR(mapVisableLastFrame) = false;
GVAR(mapGpsShow) = true;

GVAR(mapTool_Shown) = 0;
GVAR(mapTool_pos) = [0,0];
GVAR(mapTool_angle) = 0;
GVAR(mapTool_isDragging) = false;
GVAR(mapTool_isRotating) = false;

GVAR(drawing_isDrawing) = false;
GVAR(drawing_tempLineMarker) = [];
GVAR(drawing_lineMarkers) = [];
GVAR(drawing_drawColor) = "ColorBlack";
GVAR(drawing_controls) = [36732, 36733, 36734, 36735, 36736, 36737];

// This spawn is probably worth keeping, as pfh don't work natively on the briefing screen and IDK how reliable the hack we implemented for them is.
// The thread dies as soon as the mission start, so it's not really compiting for scheduler space.
[] spawn {
    _fnc_installMapEvents = {
        private "_d";
        _d = _this;
        ((findDisplay _d) displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {_this call FUNC(handleMouseMove);}];
        ((findDisplay _d) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", {[1, _this] call FUNC(handleMouseButton);}];
        ((findDisplay _d) displayCtrl 51) ctrlAddEventHandler ["MouseButtonUp", {[0, _this] call FUNC(handleMouseButton)}];
        ((findDisplay _d) displayCtrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(updateMapToolMarkers);}];
        (findDisplay _d) displayAddEventHandler ["KeyDown", {_this call FUNC(handleKeyDown);}];
    };

    // Wait until the briefing map is detected
    // display = 37 for SP
    // display = 52 for host server on MP;
    // display = 53 for MP clients)
    waitUntil {(!isNull findDisplay 37) || (!isNull findDisplay 52) || (!isNull findDisplay 53) || (!isNull findDisplay 12)};

    if (isNull findDisplay 12) then {
        // Install event handlers on the map control of the briefing screen (control = 51)
        GVAR(drawing_syncMarkers) = true;
        if (!isNull findDisplay 52) then {
            52 call _fnc_installMapEvents;
        } else {
            if (!isNull findDisplay 53) then {
                53 call _fnc_installMapEvents;
            } else {
                37 call _fnc_installMapEvents;
            };
        };
    } else {
        // Briefing screen was skipped; the player is JIP, create the markers defined during the briefing
        GVAR(drawing_syncMarkers) = false;
        {
            _x call FUNC(addLineMarker);
        } forEach GVAR(drawing_serverLineMarkers);
    };

    // Wait until the main map display is detected (display = 12)
    waitUntil { !isNull findDisplay 12 };
    // Install event handlers on the map control and display (control = 51)
    GVAR(drawing_syncMarkers) = false;
    12 call _fnc_installMapEvents;

    // Update the size and rotation of map tools
    [] call FUNC(updateMapToolMarkers);
};

["mapOpened", {
    // Show GPS if required
    [GVAR(mapGpsShow)] call FUNC(openMapGps);
}] call EFUNC(common,addEventHandler);

["mapClosed", {
    // Hide GPS
    [false] call FUNC(openMapGps);
    // Cancel drawing
    call FUNC(cancelDrawing);
}] call EFUNC(common,addEventHandler);
