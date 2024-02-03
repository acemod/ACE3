#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Return if the position is inside the map marker (to allow dragging) or not.
 *
 * Arguments:
 * 0: x position (in meters) <NUMBER>
 * 1: y position (in meters) <NUMBER>
 *
 * Return Value:
 * Where in the plotting board it is <NUMBER>
 * -1 - Nowhere, 0 - In the Board, 1 - In the Acrylic, 2 - In the Ruler
 *
 * Example:
 * [0, 5] call ace_maptools_fnc_isInsidePlottingBoard
 *
 * Public: No
 */

if (GVAR(plottingBoard_Shown) == 0) exitWith {-1};

private _relPos = _this vectorDiff GVAR(plottingBoard_pos);
private _dist = vectorMagnitude _relPos;

private _isRuler = if (GVAR(plottingBoard_Shown) == 2) then {
    // If it's within these bounds, it's going to be on the ruler
    if (_dist <= PLOTTINGBOARD_RULERCENTER) exitWith {true};

    private _rulerVector = [sin GVAR(plottingBoard_rulerAngle), cos GVAR(plottingBoard_rulerAngle)];
    private _dirRightVector = [_dirVector select 1, -(_dirVector select 0)];
    private _rulerAng = acos (_rulerVector vectorCos _relPos);

    if (cos _rulerAng > 0 && {(tan _rulerAng) * _dist < PLOTTINGBOARD_RULERHALFWIDTH}) exitWith {true};

    _dist > PLOTTINGBOARD_RULERINNERCIRCLE && {_dist < PLOTTINGBOARD_RULEROUTERCIRCLE && {abs (_rulerAng * DEGTOMILS) < PLOTTINGBOAR_RULEROUTERHALFANGLE}}
} else {
    false
};

if (_isRuler) exitWith {2};

// If it's within 3000 meters, it's going to be on the acrylic
if (_dist < PLOTTINGBOARD_RULEROUTERCIRCLE) exitWith {1};

private _dirVector = [sin GVAR(plottingBoard_angle), cos GVAR(plottingBoard_angle)];
private _dirRightVector = [_dirVector select 1, -(_dirVector select 0)];

// Projection of the relative position over the longitudinal axis of the map tool
private _ang = _dirVector vectorCos _relPos;
private _ang2 = _dirRightVector vectorCos _relPos;

private _relPosAdjusted = [_ang2 * _dist / PLOTTINGBOARD_DRAWRANGE, _ang * _dist / PLOTTINGBOARD_DRAWRANGE];

if ((_relPosAdjusted select 0 > 0) && (_relPosAdjusted select 0 < 1) && (abs (_relPosAdjusted select 1) < 1)) exitWith {0};

-1
