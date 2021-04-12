#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Simple form of proportional navigation: does not take into account target velocity
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_simpleProNav
 *
 * Public: No
 */
params ["_args", "_timestep", "_seekerTargetPos", "_profileAdjustedTargetPos"];
_args params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["","","","","","","_projectile"];
_stateParams params ["", "", "", "","_navigationParams"];
_navigationParams params ["_lastLineOfSight"];

// LOS navigation implemented via https://apps.dtic.mil/sti/pdfs/ADA481330.pdf (called bang-bang)

private _closingVelocity = vectorMagnitude velocity _projectile;
private _lineOfSight = vectorNormalized (_profileAdjustedTargetPos vectorDiff getPosASLVisual _projectile);

// the los rate is tiny, so we multiply by a constant of a power of ten to get more aggressive acceleration
// this is just due to how we measure our LOS delta, the vectors involved are _tiny_
private _losDelta = _lineOfSight vectorDiff _lastLineOfSight;
private _losRate = 1000 * (vectorMagnitude _losDelta) / _timestep;

private _commandedAcceleration = _closingVelocity vectorMultiply _losRate;

// we need acceleration normal to our LOS
private _commandedAccelerationProjected = _lineOfSight vectorMultiply (_commandedAcceleration vectorDotProduct _lineOfSight);
_commandedAcceleration = _commandedAcceleration vectorDiff _commandedAccelerationProjected;

if (accTime > 0) then {
	_navigationParams set [0, _lineOfSight];
};

_commandedAcceleration
