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

params ["_display", "_closeNum"];
TRACE_2("params",_display,_closeNum);

private _editingMarker = !(GVAR(editingMarker) isEqualTo "");

if (_closeNum isEqualTo 1) then {
    if (_editingMarker) then {
        //delete "old" marker
        deleteMarker GVAR(editingMarker);
    };
    // set and send marker data the next frame. the actual marker isn't created yet
    [{
        params ["_startingMarkers", "_editingMarker"];
        private _newMarkers = allMapMarkers - _startingMarkers;

        private _newestMarker = "";
        private _newestMarkerDist = 1e10;

        {
            private _distX = GVAR(currentMarkerPosition) distance2d (getMarkerPos _x);
            if (_distX < _newestMarkerDist) then {
                _newestMarker = _x;
                _newestMarkerDist = _distX;
            };
        } forEach _newMarkers;

        TRACE_3("",_newestMarker,_newestMarkerDist,_newMarkers);

        if (_newestMarker == "") exitWith {ERROR_1("could not find user placed marker from %1",_newMarkers);};

        // provide hook for external scripts
        [QGVAR(markerPlaced),[_newestMarker, _editingMarker]] call CBA_fnc_localEvent;
        
        // Add to list of user placed markers, and then filter for deleted
        GVAR(userPlacedMarkers) pushBack _newestMarker;
        GVAR(userPlacedMarkers) = GVAR(userPlacedMarkers) select {!((getMarkerPos _x) isEqualTo [0,0,0])};

        [QGVAR(setMarkerNetwork), [
            _newestMarker, [
                GETGVAR(currentMarkerConfigName,""),
                GETGVAR(currentMarkerColorConfigName,""),
                GETGVAR(currentMarkerPosition,[]),
                GETGVAR(currentMarkerAngle,0)
            ]
        ]] call CBA_fnc_globalEvent;

    }, [allMapMarkers, _editingMarker]] call CBA_fnc_execNextFrame;
} else {
    if (_editingMarker) then {
        // editing was canceled show the original marker again
        GVAR(editingMarker) setMarkerAlphaLocal 1;
    };
};

GVAR(editingMarker) = "";
