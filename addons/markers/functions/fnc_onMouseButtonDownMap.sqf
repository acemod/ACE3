/*
 * Author: chris579
 * Triggered when a mouse button is pressed on the map.
 *
 * Arguments:
 * 0: Map Control the EVH was assigned to <CONTROL>
 * 1: Button code <NUMBER>
 * 2: Position of x <NUMBER>
 * 3: Position of y <NUMBER>
 * 4: State of Shift <BOOL>
 * 5: State of Ctrl <BOOL>
 * 6: State of Alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 2, 0, 0, true, false, false] call ace_markers_fnc_onMouseButtonDownMap
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_mapCtrl", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

if (_button != 0) exitWith {};

private _mouseOver = ctrlMapMouseOver _mapCtrl;

if (count _mouseOver == 2) then {
    if ((_mouseOver select 0) == "marker") then {
        private _markerName = _mouseOver select 1;

        if (_markerName find "_USER_DEFINED" != -1) then {
            if (!_ctrl && !_shift && _alt && ([] call FUNC(canMoveMarker))) then {
                // move marker
                _mapCtrl ctrlMapCursor ["Track", "Move"];

                if !([QGVAR(markerMoveStarted), [ACE_player, _markerName, getMarkerPos _markerName]] call CBA_fnc_localEvent) exitWith {};

                ACE_player setVariable [QGVAR(movedMarkerOrigin), getMarkerPos _markerName];
                ACE_player setVariable [QGVAR(movedMarkerAlpha), markerAlpha _markerName];
                ACE_player setVariable [QGVAR(moveInProgress), true];
                ACE_player setVariable [QGVAR(mapGesturesSetting), EGVAR(map_gestures,enabled)];
                EGVAR(map_gestures,enabled) = false;

                _markerName setMarkerAlphaLocal 0.5;
                [FUNC(movePFH), 0, [_markerName]] call CBA_fnc_addPerFrameHandler;

            };
        };
    };
};
