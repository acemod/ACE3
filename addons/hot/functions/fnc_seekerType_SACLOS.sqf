#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Active Radar Homing seeker
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Seeker Pos <ARRAY>
 *
 * Example:
 * [] call ace_hellfire_fnc_activeRadarHoming
 *
 * Public: No
 */
params ["", "_args"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","_ammo","","_projectile"];
//_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo"];
//_targetLaunchParams params ["_target", "_targetPos", "_launchPos"];
//_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState"];
//_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange"];

private _shooterPos = getPosASL _shooter;
private _projPos = getPosASL _projectile;

private _lookDirection = if !(_shooter isKindOf "CAManBase") then {
    _shooter weaponDirection ((_shooter weaponsTurret[0]) select 0);
} else {
    _shooter weaponDirection _weapon;
};

private _distanceToProj = _shooterPos vectorDistance _projPos;
_shooterPos vectorAdd (_lookDirection vectorMultiply (_distanceToProj + 100));

//terrainIntersectAtASL [_shooterPos, _shooterPos vectorAdd (_lookDirection vectorMultiply 5000)];

