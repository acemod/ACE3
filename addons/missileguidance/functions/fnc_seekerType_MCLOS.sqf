#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * MCLOS guidance "seeker".
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [...]] call ace_missileguidance_fnc_seekerType_MCLOS;
 *
 * Public: No
 */
params ["", "_args"];
_args params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["", "", "", "", "", "", "_projectile"];
_stateParams params ["", "_seekerState"];
_seekerState params ["_initialized"];

if (isNil "_initialized") then {
    // Missile just launched, reset
    GVAR(mclosMissile) = _projectile;
    GVAR(mclosInput) = [0, 0, 0, 0];
    _seekerState pushBack true;
};

// Another missile was fired after this one, fly straight
if (GVAR(mclosMissile) != _projectile) exitWith {[0, 1, 0]};

private _vx = GVAR(mclosInput)#MCLOS_RIGHT - GVAR(mclosInput)#MCLOS_LEFT;
private _vz = GVAR(mclosInput)#MCLOS_UP    - GVAR(mclosInput)#MCLOS_DOWN;
private _steerVector = vectorNormalized [_vx, 1, _vz];

(getPosASL _projectile) vectorAdd (_projectile vectorModelToWorld _steerVector)
