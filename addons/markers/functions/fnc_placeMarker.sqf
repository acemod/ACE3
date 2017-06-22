/*
 * Author: commy2
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
#include "script_component.hpp"

disableserialization;
params ["_display", "_closeNum"];
TRACE_2("params",_display,_closeNum);

if (_closeNum == 1) then {
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
};
