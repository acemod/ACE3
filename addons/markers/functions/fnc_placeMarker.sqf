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
        private _marker = allMapMarkers select (count allMapMarkers - 1);
        private _data = [
            GETGVAR(currentMarkerConfigName,""),
            GETGVAR(currentMarkerColorConfigName,""),
            GETGVAR(currentMarkerPosition,[]),
            GETGVAR(currentMarkerAngle,0),
            markerText _marker
        ];

        if (GVAR(enableUniqueMaps) && {time > 0}) then {
            //delete global marker and create local - unique for this map
            deleteMarker _marker;
            private _newMarker = createMarkerLocal [format ["%1_%2", _marker, GVAR(currentMapID)], [0,0,0]];
            [_newMarker, _data] call FUNC(setMarkerLocal);

            GVAR(currentMapMarkers) pushBack _newMarker;
            GVAR(currentMapMarkersProperties) pushBack _data;
            GVAR(newMapMarkers) pushBack [_newMarker, _data];
        } else {
            //unique maps disabled or player is on briefing - make global marker
            [QGVAR(setMarkerGlobal), [_marker, _data]] call EFUNC(common,globalEvent);
        };
    }, []] call EFUNC(common,execNextFrame);
};
