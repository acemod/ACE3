/*
 * Author: chris579
 * When the marker is being moved.
 *
 * Arguments:
 * 0: Marker data <ARRAY>
 * 1: PFH ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[MARKER], 5] call ace_markers_fnc_movePFH
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_marker"];

if (isNull (findDisplay 12 displayCtrl 51) || !(player getVariable [QGVAR(moveInProgress), false])) exitWith {
    [_idPFH] call CBA_fnc_removePerFrameHandler;

    _marker = (player getVariable[QGVAR(movedMarker), ""]);
    [QGVAR(applyMarkerPosLocal), [_marker, getMarkerPos _marker]] call CBA_fnc_globalEvent;
    _marker setMarkerAlphaLocal (player getVariable [QGVAR(movedMarkerAlpha), 1]);

    EGVAR(map_gestures,enabled) = player getVariable [QGVAR(mapGesturesSetting), false];
    (findDisplay 12 displayCtrl 51) ctrlMapCursor ["Track", "Track"];
    [QGVAR(markerMoveEnded), [_marker, ACE_player]] call CBA_fnc_localEvent;
};

_marker setMarkerPosLocal ((findDisplay 12 displayCtrl 51) posScreenToWorld getMousePosition);
