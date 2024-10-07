#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Attack profile: JDAM
 * Uses LINE navigation type to guide projectile onto target
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_jdam;
 *
 * Public: No
 */
params ["_seekerTargetPos", "_args", "_attackProfileStateParams", "_timestep"];
_args params ["_firedEH", "", "_flightParams", "", "", "_targetData"];
_firedEH params ["_shooter","","","","","","_projectile"];
_attackProfileStateParams params ["_gpsData", "_initialProjectileHeight", "_terminal"];
_gpsData params ["", "_impactAngle", "_attackDirection"];
_targetData params ["_directionToTarget", "", "_distanceToTarget"];
_flightParams params ["_pitchRate", "_yawRate"];

if (_impactAngle <= 0) then {
    _impactAngle = 45; // immediate pitch over to attack
};

if (_attackDirection < 0) then {
    _attackDirection = direction _projectile;
    _gpsData set [2, _attackDirection];
};

private _projectilePos = getPosASLVisual _projectile;
private _lineDir = [1, 180 + _attackDirection, _impactAngle] call CBA_fnc_polar2vect;

private _leadDistance = linearConversion [0, 1000, _projectilePos vectorDistance _seekerTargetPos, 5, 500, true];

private _missilePosProjected = _seekerTargetPos vectorAdd (_lineDir vectorMultiply ((_projectilePos vectorDistance _seekerTargetPos) - _leadDistance));
// don't climb
if (_missilePosProjected#2 > _projectilePos#2) then {
    _missilePosProjected set [2, _projectilePos#2];  
};
_targetData set [2, (_projectilePos vectorDistance _missilePosProjected)];

if (GVAR(debug_drawGuidanceInfo)) then {
    private _projectilePitch = ((vectorDir _projectile) call CBA_fnc_vect2polar) select 2;
    //IGNORE_PRIVATE_WARNING ["_attackProfileName"];
    _attackProfileName = format ["JDAM [Pitch - %1  Impact Pitch - %2]", _projectilePitch, _impactAngle];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL _missilePosProjected, 0.75, 0.75, 0, "P", 1, 0.025, "TahomaB"];
    private _desiredAngle = _lineDir vectorMultiply 5000;
    private _targetPosAGL = ASLToAGL _seekerTargetPos;
    drawLine3D [_targetPosAGL, _targetPosAGL vectorAdd _desiredAngle, [1, 1, 1, 1]];
};

_missilePosProjected

