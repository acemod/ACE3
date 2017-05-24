/*
 * Author: SilentSpike, voiper
 * Handles the spectator UI compass
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleCompass, 0, _display] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

// Kill PFH when compass hidden (or display is closed)
if (isNil QGVAR(compHandler)) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

private ["_compass","_NE","_ES","_SW","_WN","_compassW","_degree","_heading","_offset","_positions","_sequence"];

_compass = _display displayCtrl IDC_COMP;

_NE = _compass controlsGroupCtrl IDC_COMP_0;
_ES = _compass controlsGroupCtrl IDC_COMP_90;
_SW = _compass controlsGroupCtrl IDC_COMP_180;
_WN = _compass controlsGroupCtrl IDC_COMP_270;

_compassW = (ctrlPosition _compass) select 2;
_degree = _compassW / 180;

// Get direction of screen rather than object (accounts for unit freelook)
_heading = (positionCameraToWorld [0,0,1]) vectorDiff (positionCameraToWorld [0,0,0]);
_heading = (((_heading select 0) atan2 (_heading select 1)) + 360) % 360;
_offset = -(_heading % 90) * _degree;

_positions = [
    [_compassW * -0.5 + _offset, 0],
    [_offset, 0],
    [_compassW * 0.5 + _offset, 0],
    [_compassW + _offset, 0]
];

_sequence = [
    [_SW, _WN, _NE, _ES],
    [_WN, _NE, _ES, _SW],
    [_NE, _ES, _SW, _WN],
    [_ES, _SW, _WN, _NE]
] select floor(_heading/90);


{
    _x ctrlSetPosition (_positions select _forEachIndex);
    _x ctrlCommit 0;
} forEach _sequence;
