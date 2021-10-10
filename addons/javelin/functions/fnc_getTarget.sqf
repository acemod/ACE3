#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Find a target within the optic range
 *
 * Arguments:
 * 0: Last Target (seeds the scan) <OBJECT>
 * 1: Max Range (meters) <NUMBER>
 *
 * Return Value:
 * Target <OBJECT>
 *
 * Example:
 * [bob, 5] call ace_javelin_fnc_getTarget
 *
 * Public: No
 */

params ["_lastTarget", "_maxRange"];

scopeName "main";

private _viewASL = AGLtoASL positionCameraToWorld [0,0,0];
private _viewDir = _viewASL vectorFromTo (AGLtoASL positionCameraToWorld [0,0,1]);

// Attempt to lock onto current target if it is still valid
if (!isNull _lastTarget) then {
    private _aimASL = aimPos _lastTarget;

    if ((_viewASL vectorDistance _aimASL) > _maxRange) exitWith {};
    if ((acos ((_viewASL vectorFromTo _aimASL) vectorDotProduct _viewDir)) > 0.6) exitWith {};

    private _relAngle = (_lastTarget getRelDir _viewASL);

    for "_xOffset" from -2.5 to 2.5 step 0.5 do {
        for "_yOffset" from -2 to 1 step 0.5 do {
            // Find test points in the model based on the angle that we are viewing it from (not true 3d projection, but not bad)
            private _testPosASL = _lastTarget modelToWorldWorld [_xOffset * - cos _relAngle, _xOffset * sin _relAngle, _yOffset];
            private _intersectionsToCursorTarget = lineIntersectsSurfaces [_viewASL, _testPosASL, ace_player, vehicle ace_player, true, 1];
            // drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [[0,1,1,1], [1,0,1,1]] select (count _intersectionsToCursorTarget), (ASLtoAGL _testPosASL), 0.25, 0.25, 0, "", 0.5, 0.025, "TahomaB"];
            if (_intersectionsToCursorTarget isNotEqualTo []) then {
                (_intersectionsToCursorTarget select 0) params ["", "", "_intersectedObject"];
                if (_intersectedObject isKindOf "AllVehicles") then {
                    _intersectedObject breakOut "main";
                };
            };
        };
    };
};

// Try cursorObject/Target as they are very fast
if ((cursorObject isKindOf "AllVehicles") && {(cursorObject distance ace_player) < _maxRange}) then {
    private _intersectionsToCursorTarget = lineIntersectsSurfaces [_viewASL, aimPos cursorObject, ace_player, cursorObject, true, 1];
    if (_intersectionsToCursorTarget isEqualTo []) then {
        cursorObject breakOut "main";
    };
};
if ((cursorTarget isKindOf "AllVehicles") && {(cursorObject distance ace_player) < _maxRange}) then {
    private _intersectionsToCursorTarget = lineIntersectsSurfaces [_viewASL, aimPos cursorTarget, ace_player, cursorTarget, true, 1];
    if (_intersectionsToCursorTarget isEqualTo []) then {
        cursorTarget breakOut "main";
    };
};

// Attempt to scan using multiple rayscasts - This is expensive (n^2) and care should be given to balance accuracy vs speed
for "_xOffset" from -14 to 14 step 2 do {
    for "_yOffset" from -12 to 12 step 4 do {
        private _testPosASL = AGLtoASL (positionCameraToWorld [_xOffset, _yOffset, _maxRange]);
        private _intersectionsToCursorTarget = lineIntersectsSurfaces [_viewASL, _testPosASL, ace_player, vehicle ace_player, true, 1];
        // drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [[0,1,0,1], [1,0,0,1]] select (count _intersectionsToCursorTarget), (ASLtoAGL _testPosASL), 0.25, 0.25, 0, "", 0.5, 0.025, "TahomaB"];
        if (_intersectionsToCursorTarget isNotEqualTo []) then {
            (_intersectionsToCursorTarget select 0) params ["", "", "_intersectedObject"];
            if (_intersectedObject isKindOf "AllVehicles") then {
                _intersectedObject breakOut "main";
            };
        };
    };
};

objNull
