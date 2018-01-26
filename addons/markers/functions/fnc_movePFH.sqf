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

(_this select 0) params ["_marker", "_ctrlMap", "_originalPos", "_originalAlpha"];

if (isNull _ctrlMap || !GVAR(moving)) exitWith {
    (_this select 1) call CBA_fnc_removePerFrameHandler;

    private _finalPos = getMarkerPos _marker;

    if !([QGVAR(markerMoveEnded), [ACE_player, _marker, _originalPos, _finalPos]] call CBA_fnc_localEvent) then {
        _marker setMarkerPosLocal _originalPos;
    } else {
        [QGVAR(setMarkerPosLocal), [_marker, _finalPos]] call CBA_fnc_globalEvent;
    };

    _marker setMarkerAlphaLocal _originalAlpha;
    _ctrlMap ctrlMapCursor ["Track", "Track"];
};

_marker setMarkerPosLocal (_ctrlMap posScreenToWorld getMousePosition);
