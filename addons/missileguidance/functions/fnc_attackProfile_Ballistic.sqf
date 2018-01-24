/*
 * Author: xrufix
 * Attack profile: Ballistic (use with smart guided bombs like Paveway III or JDAM)
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_ballistic;
 *
 * Public: No
 */
#include "script_component.hpp"
#define GFORCE 4

params ["_seekerTargetPos", "_args"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

if (_seekerTargetPos == [0,0,0]) exitWith {_seekerTargetPos};

private _relativeHeight = (_seekerTargetPos select 2) - ((getPosASL _projectile) select 2);
private _distance2D = _projectile distance2D _seekerTargetPos;
private _velocity = speed _projectile / 3.6; // m/s


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

private _returnTargetHeight = 2 + _distance2D * (tan _angle) + ((getPosASL _projectile) select 2);
private _returnTargetPos = [_seekerTargetPos select 0, _seekerTargetPos select 1, _returnTargetHeight];

TRACE_2("",_angle,_returnTargetPos);

_returnTargetPos