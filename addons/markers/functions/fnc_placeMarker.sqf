#include "script_component.hpp"
/*
 * Author: commy2, Timi007
 * MarkerPlacement closed
 *
 * Arguments:
 * 0: RscDisplayInsertMarker <DISPLAY>
 * 1: CloseNumber (1 = ButtonOk) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [onUnloadEvent] call ace_markers_fnc_placeMarker;
 *
 * Public: No
 */

disableserialization;
params ["_display", "_closeNum"];
TRACE_2("params",_display,_closeNum);

if (_closeNum isEqualTo 1) then {
    if !(GVAR(editingMarker) isEqualTo "") then {
        //delete "old" marker
        deleteMarker GVAR(editingMarker);
    };
    // set and send marker data the next frame. the actual marker isn't created yet
    [{
        [QGVAR(setMarkerNetwork), [
            allMapMarkers select (count allMapMarkers - 1), [
                GETGVAR(currentMarkerConfigName,""),
                GETGVAR(currentMarkerColorConfigName,""),
                GETGVAR(currentMarkerPosition,[]),
                GETGVAR(currentMarkerAngle,0)
            ]
        ]] call CBA_fnc_globalEvent;

    }, []] call CBA_fnc_execNextFrame;
} else {
    if !(GVAR(editingMarker) isEqualTo "") then {
        //editing was canceled show the original marker again
        GVAR(editingMarker) setMarkerAlphaLocal 1;
    };
};

GVAR(editingMarker) = "";
