#include "script_component.hpp"

params ["_bomb", "_targetPos"];

private _relativeHeight = (_targetPos select 2) - ((getPosASL _bomb) select 2);
private _distance2D = _bomb distance2D _targetPos;
private _velocity = speed _bomb / 3.6; // m/s

//TRACE_5("params",_bomb,_targetPos,_relativeHeight,_distance2D,_velocity);

#define GFORCE 4

private _angle = (atan (
    ((_velocity ^2) - sqrt (
        ((_velocity ^4) - GFORCE * (GFORCE * (_distance2D ^2) + 2 * (_relativeHeight) * (_velocity ^2)))
        max
        0
    ))
    / (GFORCE * _distance2D) 
)) min (atan (
    ((_velocity ^2) + sqrt (
        ((_velocity ^4) - GFORCE * (GFORCE * (_distance2D ^2) + 2 * (_relativeHeight) * (_velocity ^2)))
        max
        0
    ))
    / (GFORCE * _distance2D) 
));

//asin ( sqrt ( 0.5 - ( _relativeHeight / ( 2 * sqrt ( _distance2D ^ 2 + _relativeHeight ^ 2 )))));

private _adjustedTargetHeight = 2 + _distance2D * (tan _angle) + ((getPosASL _bomb) select 2);
private _adjustedTargetPos = [_targetPos select 0, _targetPos select 1, _adjustedTargetHeight];

TRACE_2("",_angle,_adjustedTargetPos);
#ifdef DRAW_GUIDANCE_INFO
    hintSilent str _adjustedTargetPos;
    drawLine3D [(ASLtoAGL _adjustedTargetPos), (ASLtoAGL _targetPos), [0,1,1,1]];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLtoAGL _adjustedTargetPos, 0.5, 0.5, 0, "AIM", 1, 0.025, "TahomaB"];
#endif

_adjustedTargetPos