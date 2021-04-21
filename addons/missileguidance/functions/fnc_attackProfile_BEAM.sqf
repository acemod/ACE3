#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Attack profile: Beam guided. Exact same as wire-guided, except no wire cutting
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_BEAM;
 *
 * Public: No
 */
params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];
_attackProfileStateParams params["_maxCorrectableDistance", "_wireCut", "_randomVector", "_crosshairOffset", "_seekerMaxRangeSqr", "_seekerMinRangeSqr", "_wireCutSource", "_distanceAheadOfMissile"];

private _projectilePos = getPosASL _projectile;
private _shooterPos = getPosASL _shooter;

private _distanceToProjectile = _shooterPos vectorDistanceSqr _projectilePos;

if (_seekerTargetPos isEqualTo [0, 0, 0] || { _distanceToProjectile < _seekerMinRangeSqr }) exitWith {
    // return position 50m infront of projectile and a bit up to get out of the way of the ground
    _projectilePos vectorAdd (_projectile vectorModelToWorld [0, 50, 3])
};

_seekerTargetPos vectorAdd _crosshairOffset

