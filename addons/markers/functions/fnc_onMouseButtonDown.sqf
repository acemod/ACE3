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
 * [CONTROL, 2, 0, 0, true, false, false] call ace_markers_fnc_onMouseButtonDown
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ctrlMap", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

if (_button != 0 || {!([_shift, _ctrl, _alt] isEqualTo [false, false, true])}) exitWith {};

ctrlMapMouseOver _ctrlMap params [["_type", ""], "_marker"];

if (_type == "marker" && {_marker find "_USER_DEFINED" != -1 && {call FUNC(canMove)}}) then {
    _ctrlMap ctrlMapCursor ["Track", "Move"];

    private _originalPos = getMarkerPos _marker;
    private _originalAlpha = markerAlpha _marker;

    if !([QGVAR(markerMoveStarted), [ACE_player, _marker, _originalPos]] call CBA_fnc_localEvent) exitWith {};

    GVAR(moving) = true;
    _marker setMarkerAlphaLocal 0.5;
    [FUNC(movePFH), 0, [_marker, _ctrlMap, _originalPos, _originalAlpha]] call CBA_fnc_addPerFrameHandler;
};
