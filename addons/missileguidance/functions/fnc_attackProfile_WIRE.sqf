#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Attack profile: Wire guided
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_WIRE;
 *
 * Public: No
 */
params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];
_attackProfileStateParams params["_maxCorrectableDistance", "_wireCut", "_randomVector", "_crosshairOffset", "_seekerMaxRangeSqr", "_seekerMinRangeSqr", "_wireCutSource", "_distanceAheadOfMissile"];

private _projectilePos = getPosASL _projectile;
private _shooterPos = getPosASL _shooter;

private _shooterDir = vectorNormalized(_seekerTargetPos vectorDiff _shooterPos);
private _distanceToProjectile = _shooterPos vectorDistanceSqr _projectilePos;

if ((_distanceToProjectile > _seekerMaxRangeSqr) || { _wireCut }) exitWith {
    // wire snap, random direction
    if (_randomVector isEqualTo [0, 0, 0]) then {
        _randomVector = RANDOM_VECTOR_3D vectorMultiply 300;
        _attackProfileStateParams set [1, true];
        _attackProfileStateParams set [2, _randomVector];

        playSound3D ["a3\sounds_f\air\sfx\SL_rope_break.wss", objNull, false, AGLtoASL (_shooter modelToWorld _wireCutSource), 5, 1, 150];
    };
    _projectilePos vectorAdd _randomVector
};

if (_seekerTargetPos isEqualTo [0, 0, 0] || { _distanceToProjectile < _seekerMinRangeSqr }) exitWith {
    // cut wire if its caught on terrain
    /*if !(lineIntersectsSurfaces [getPosASL _shooter, _projectilePos, _shooter] isEqualTo []) then {
        _attackProfileStateParams set [1, true];
    };*/
    // return position 50m infront of projectile
    _projectilePos vectorAdd (_projectile vectorModelToWorld [0, 50, 0])
};

private _relativeCorrection = _projectile vectorWorldToModel (_projectilePos vectorDiff _seekerTargetPos);
_relativeCorrection = _relativeCorrection vectorDiff _crosshairOffset;

private _magnitude = vectorMagnitude [_relativeCorrection select 0, 0, _relativeCorrection select 2];
private _fovImpulse = 1 min (_magnitude / _maxCorrectableDistance); // the simulated impulse for the missile being close to the center of the crosshair

// Adjust the impulse due to near-zero values creating wobbly missiles?
private _correction = _fovImpulse;


_relativeCorrection = (vectorNormalized _relativeCorrection) vectorMultiply _correction;
private _returnPos = _projectilePos vectorDiff (_projectile vectorModelToWorld _relativeCorrection);
_returnPos vectorAdd (_shooterDir vectorMultiply _distanceAheadOfMissile)
