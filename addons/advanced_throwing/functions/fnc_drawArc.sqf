#include "script_component.hpp"
/*
 * Author: Zapat, Dslyecxi, Jonpas
 * Draws throw arc.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Flight path (just for debug) <ARRAY>
 *
 * Example:
 * call ace_advanced_throwing_fnc_drawArc
 *
 * Public: No
 */

// Disable drawing when intersecting with the vehicle
if !([ACE_player] call FUNC(canThrow)) exitWith {
    drawIcon3D ["\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_cancel_manualfire_ca.paa", [1, 0, 0, 1], positionCameraToWorld [0, 0, 1], 1, 1, 0, "", 1];
};

private _activeThrowable = ACE_player getVariable [QGVAR(activeThrowable), objNull];

// Exit during switches and similar where object can be null for a very short amount of time
if (isNull _activeThrowable) exitWith {};

private _dropMode = ACE_player getVariable [QGVAR(dropMode), false];
private _throwType = ACE_player getVariable [QGVAR(throwType), THROW_TYPE_DEFAULT];
private _throwSpeed = ACE_player getVariable [QGVAR(throwSpeed), THROW_SPEED_DEFAULT];

private _direction = [THROWSTYLE_NORMAL_DIR, THROWSTYLE_HIGH_DIR] select (_throwType == "high" || {_dropMode});
private _velocity = [_throwSpeed, _throwSpeed / THROWSTYLE_HIGH_VEL_COEF / 1.25] select (_throwType == "high");
_velocity = [_velocity, THROWSTYLE_DROP_VEL] select _dropMode;

private _viewStart = AGLToASL (positionCameraToWorld [0, 0, 0]);
private _viewEnd = AGLToASL (positionCameraToWorld _direction);

private _initialVelocity = (vectorNormalized (_viewEnd vectorDiff _viewStart)) vectorMultiply (_velocity);
private _prevTrajASL = getPosASLVisual _activeThrowable;

private _pathData = [];

for "_i" from 0.05 to 1.45 step 0.1 do {
    private _newTrajASL = (getPosASLVisual _activeThrowable) vectorAdd (_initialVelocity vectorMultiply _i) vectorAdd ([0, 0, -4.9] vectorMultiply (_i * _i));
    private _cross = 0;

    if (_newTrajASL distance (getPosASLVisual ACE_player) <= 20) then {
        if ((ASLToATL _newTrajASL) select 2 <= 0) then {
            _cross = 1; // 1: Distance Limit (Green)
        } else {
            // Even vanilla throwables go through glass, only "GEOM" LOD will stop it but that will also stop it when there is glass in a window
            if (lineIntersects [_prevTrajASL, _newTrajASL]) then { // Checks the "VIEW" LOD
                _cross = 2; // 2: View LOD Block (Red)
            } else {
                if !((lineIntersectsSurfaces [_prevTrajASL, _newTrajASL, _activeThrowable, ACE_player, true, 1, "GEOM", "FIRE"]) isEqualTo []) then {
                    _cross = 3; // 3: GEOM/FIRE LOD Block (Yellow) - pass a3 bulding glass, but blocked on some CUP glass
                };
            };
        };

        private _iDim = linearConversion [20, 0, _newTrajASL distance (getPosASLVisual ACE_player), 0.3, 2.5, true];
        private _alpha = linearConversion [20, 0, _newTrajASL distance (getPosASLVisual ACE_player), 0.05, 0.7, true];
        private _movePerc = linearConversion [3, 0, vectorMagnitude (velocity ACE_player), 0, 1, true];
        _alpha = _alpha * _movePerc;

        private _col = [ [1, 1, 1, _alpha], [0, 1, 0, _alpha], [1, 0, 0, _alpha], [1, 1, 0, _alpha] ] select _cross;

        if (_cross != 2 && {lineIntersects [eyePos ACE_player, _newTrajASL]}) then {
            _col set [3, 0.1];
        };

        _pathData pushBack [_col, ASLToAGL _newTrajASL, _iDim];
    };

    if (_cross > 0) exitWith {};

    _prevTrajASL = _newTrajASL;
};

reverse _pathData;
// To get the sort order correct from our POV, particularly when using outlined dots
{
    _x params ["_col", "_newTrajAGL", "_iDim"];
    drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", _col, _newTrajAGL, _iDim, _iDim, 0, "", 2];

    #ifdef DRAW_THROW_PATH
        drawIcon3D ["", _col, _newTrajAGL, _iDim, _iDim, 0, str (ACE_player distance _newTrajAGL), 2, 0.05, "RobotoCondensed"];
    #endif
} forEach _pathData;

_pathData
