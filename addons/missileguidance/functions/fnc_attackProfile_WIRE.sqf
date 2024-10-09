#include "..\script_component.hpp"
/*
 * Author: tcvm
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
_args params ["_firedEH", "", "", "", "", "_targetData"];
_firedEH params ["_shooter","","","","","","_projectile"];
_attackProfileStateParams params ["_maxCorrectableDistance", "_wireCut", "_lastInput", "_crosshairOffset", "_seekerMaxRangeSqr", "_seekerMinRangeSqr", "_wireCutSource", "_distanceAheadOfMissile"];

private _projectilePos = getPosASL _projectile;
private _shooterPos = getPosASL _shooter;

private _distanceToProjectile = _shooterPos vectorDistanceSqr _projectilePos;

if ((_distanceToProjectile > _seekerMaxRangeSqr) || { _wireCut }) exitWith {
    // wire snap, random direction
    if !(_wireCut) then {
        _attackProfileStateParams set [1, true];
        playSound3D ["a3\sounds_f\air\sfx\SL_rope_break.wss", objNull, false, AGLToASL (_shooter modelToWorld _wireCutSource), 5, 1, 150];
    };
    _lastInput
};

private _final = _seekerTargetPos vectorAdd _crosshairOffset;
_attackProfileStateParams set [2, _final];

_targetData set [0, _projectilePos vectorFromTo _final];

_final
