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
 * [[1,2,3], [], []] call ace_hot_fnc_attackProfile_WIRE;
 *
 * Public: No
 */
params ["_seekerTargetPos", "_args"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];

if (_seekerTargetPos isEqualTo [0, 0, 0]) exitWith { [0, 0, 0] };

private _config = ([_projectile] call CBA_fnc_getObjectConfig) >> "ace_missileguidance" >> QGVAR(correctionDistance);
private _maxCorrectableDistance = if (isNumber(_config)) then { getNumber(_config) } else { DEFAULT_CORRECTION_DISTANCE };

private _projectilePos = getPosASL _projectile;
private _relativeCorrection = _projectile vectorWorldToModel (_projectilePos vectorDiff _seekerTargetPos);

private _magnitude = vectorMagnitude _relativeCorrection;

private _fovImpulse = 1 min (_magnitude / _maxCorrectableDistance); // the simulated impulse for the missile being close to the center of the crosshair

private _correction = _fovImpulse;

_relativeCorrection = (vectorNormalized _relativeCorrection) vectorMultiply _correction;

_projectilePos vectorDiff (_projectile vectorModelToWorld _relativeCorrection);

