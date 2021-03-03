#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Copperhead: attack profile
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
 * [[1,2,3], [], []] call ace_copperhead_fnc_attackProfile
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];
_attackProfileStateParams params ["", "_trajectoryBallistic", "_checkOrientation"];

private _projectilePos = getPosASL _projectile;
private _projectileVelocity = velocity _projectile;
private _velocityElev = acos (_projectileVelocity vectorCos [0,0,-1]); // referenced to straight down
private _isFalling = _velocityElev < 90;

private _aimASL = []; // return

if (_seekerTargetPos isEqualTo [0,0,0]) then {
    // no target
    _aimASL = _projectilePos vectorAdd _projectileVelocity;
    if (_isFalling && {!_trajectoryBallistic}) then { 
        // Shaped Trajectory - Try to glide level - adjusted to correct AoA below
        _aimASL set [2, _projectilePos # 2];
    };
 } else { 
     // have valid seeker target
    _aimASL = _seekerTargetPos;
    // aim above target due to gravity drop
    private _distance2d = _projectilePos distance2d _aimASL;
    private _speed2d = vectorMagnitude [_projectileVelocity#0, _projectileVelocity#1, 0];
    private _tof = (_distance2d / (_speed2d max 1)) min 15;
    if (_tof > 1.5) then {
        _aimASL = _aimASL vectorAdd [0,0, 2 * _tof ^2];
    };
 };

// Limit max elevation to prevent stalling - unpowered gliding
private _maxElev = 68; // ~2.5 glide ratio
private _aimDiff = _aimASL vectorDiff _projectilePos;
private _aimElev = acos (_aimDiff vectorCos [0,0,-1]);
if (_aimElev > _velocityElev) then {
    private _adjustAngle = (_maxElev max _velocityElev) - _aimElev;
    if (_adjustAngle >= 0) exitWith {};
    private _adjustOffset = (sin _adjustAngle) * vectorMagnitude _aimDiff;
    _aimASL = _aimASL vectorAdd [0,0,_adjustOffset];
};

// prevent rare "boomerang" at extremely high elevation shots the round won't flip correctly at apex
if (_isFalling && _checkOrientation) then {
    _attackProfileStateParams set [2, false];
    [_projectile, vectorNormalized _projectileVelocity] call EFUNC(missileguidance,changeMissileDirection);
};

_aimASL

