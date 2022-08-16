#include "script_component.hpp"
/*
 * Author: Jonpas
 * Change camera based on setting.
 *
 * Arguments:
 * 0: New Camera View <STRING>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["INTERNAL", vehicle] call ace_viewrestriction_fnc_changeCamera
 *
 * Public: No
 */

params ["_newCameraView", "_cameraOn"];

if (! ([_newCameraView, _cameraOn] call FUNC(canChangeCamera))) exitWith {};

TRACE_1("View Restricted",XGVAR(mode));

// FirstPerson
if (XGVAR(mode) == 1) exitWith {
    _cameraOn switchCamera "INTERNAL";
};

// ThirdPerson
if (XGVAR(mode) == 2) exitWith {
    _cameraOn switchCamera "EXTERNAL";
};

// Selective
if (XGVAR(mode) == 3) exitWith {
    [_cameraOn] call FUNC(selectiveChangeCamera);
};
