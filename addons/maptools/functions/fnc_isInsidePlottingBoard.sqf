#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Return true if the position is inside the map marker (to allow dragging).
 *
 * Arguments:
 * 0: x Position (in meters) <NUMBER>
 * 1: y Position (in meters) <NUMBER>
 *
 * Return Value:
 * Where in the Plotting Board it is <NUMBER>
 * -1 Not; 0- In the Board, 1- In the Acrylic, 2- In the Ruler
 *
 * Example:
 * [0, 5] call ACE_maptools_fnc_isInsidePlottingBoard
 *
 * Public: No
 */

if (GVAR(plottingBoard_Shown) == 0) exitWith {-1};
private _pos = [_this select 0, _this select 1, 0];

private _relPos = _pos vectorDiff [GVAR(plottingBoard_pos) select 0, GVAR(plottingBoard_pos) select 1, 0];
private _dist = _relPos distance [0,0,0];

private _isRuler = false;
if (GVAR(plottingBoard_Shown) == 2) then {
    //if it's within these bounds, it's going to be on the ruler;

    if (_dist <= PLOTTINGBOARD_RULERCENTER) then {_isRuler = true};

    private _rulerVector = [sin(GVAR(plottingBoard_rulerAngle)), cos(GVAR(plottingBoard_rulerAngle)), 0];
    private _dirRightVector = [(_dirVector select 1), -(_dirVector select 0), 0];
    private _rulerAng = acos(_rulerVector vectorCos _relPos);

    if (cos(_rulerAng) > 0 && {tan(_rulerAng) * _dist < PLOTTINGBOARD_RULERHALFWIDTH}) then {_isRuler = true};
    
    if (_dist > PLOTTINGBOARD_RULERINNERCIRCLE && {_dist < PLOTTINGBOARD_RULEROUTERCIRCLE && {abs(_rulerAng * DEGTOMILS) < PLOTTINGBOAR_RULEROUTERHALFANGLE}}) then {_isRuler = true};
};

if (_isRuler) exitWith {2};

//if it's within 3000 meters, it's GOING to be on the acrylic;
if (_dist < PLOTTINGBOARD_RULEROUTERCIRCLE) exitWith {1};

private _dirVector = [sin(GVAR(plottingBoard_angle)), cos(GVAR(plottingBoard_angle)), 0];
private _dirRightVector = [(_dirVector select 1), -(_dirVector select 0), 0];

// Projection of the relative position over the longitudinal axis of the map tool
private _ang = acos(_dirVector vectorCos _relPos);
private _ang2 = acos(_dirRightVector vectorCos _relPos);

private _relPosAdjusted = [cos(_ang2) * _dist/PLOTTINGBOARD_DRAWRANGE, cos(_ang) * _dist/PLOTTINGBOARD_DRAWRANGE];

if ((_relPosAdjusted select 0 > 0) && (_relPosAdjusted select 0 < 1) && (abs(_relPosAdjusted select 1) < 1)) exitWith {0};
 
-1
