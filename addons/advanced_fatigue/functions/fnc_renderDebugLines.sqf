#include "..\script_component.hpp"
/*
 * Author: ulteq
 * Draw lines for debugging.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_advanced_fatigue_fnc_renderDebugLines
 *
 * Public: No
 */

addMissionEventHandler ["Draw3D", {
    private _normal = surfaceNormal (getPosWorld ACE_player);
    private _beg = (getPosWorld ACE_player) vectorAdd (_normal vectorMultiply 0.5);
    private _end = _beg vectorAdd (_normal vectorMultiply 2);
    drawLine3D [ASLToAGL _beg, ASLToAGL _end, [0, 1, 0, 1]];

    private _side = vectorNormalized (_normal vectorCrossProduct [0, 0, 1]);
    private _end = _beg vectorAdd (_side vectorMultiply 2);
    drawLine3D [ASLToAGL _beg, ASLToAGL _end, [0, 0, 1, 1]];

    private _up = vectorNormalized (_normal vectorCrossProduct _side);
    private _end = _beg vectorAdd (_up vectorMultiply 2);
    drawLine3D [ASLToAGL _beg, ASLToAGL _end, [1, 0, 0, 1]];

    private _movementVector = vectorNormalized (velocity ACE_player);
    private _end = _beg vectorAdd (_movementVector vectorMultiply 2);
    drawLine3D [ASLToAGL _beg, ASLToAGL _end, [1, 1, 0, 1]];

    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    _sideVector set [2, 0];
    private _end = _beg vectorAdd (_sideVector vectorMultiply 2);
    drawLine3D [ASLToAGL _beg, ASLToAGL _end, [0, 1, 1, 1]];
}];
