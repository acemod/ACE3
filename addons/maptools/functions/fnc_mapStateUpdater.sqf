
#include "script_component.hpp"

if (visibleMap) then {
    // Show/Hide draw buttons
    if ("ACE_MapTools" in items ACE_player) then {
        { ((finddisplay 12) displayctrl _x) ctrlShow true; } forEach GVAR(drawing_controls);
    } else {
        { ((finddisplay 12) displayctrl _x) ctrlShow false; } forEach GVAR(drawing_controls);
        if (GVAR(drawing_isDrawing)) then {
            call FUNC(cancelDrawing);
        };
    };
};

//When Map is Closed:
if (GVAR(mapVisableLastFrame) && (!visibleMap)) then {
    GVAR(mapVisableLastFrame) = false;
    // Hide GPS
    [false] call FUNC(openMapGps);
    // Cancel drawing
    call FUNC(cancelDrawing);
};

//When Map is Opened:
if ((!GVAR(mapVisableLastFrame)) && (visibleMap)) then {
    //todo:  "mapOpened" Event????
    GVAR(mapVisableLastFrame) = true;
    // Show and update map tools if required
    [] call FUNC(updateMapToolMarkers);
    // Show GPS if required
    [GVAR(mapGpsShow)] call FUNC(openMapGps);
};
