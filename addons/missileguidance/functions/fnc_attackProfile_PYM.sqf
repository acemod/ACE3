#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_target", "_seekerTargetPos", "_launchParams", "_targetLaunchParams", "_targetPos", "_projectilePos"];

_seekerTargetPos = _this select 0;
_launchParams = _this select 1;

_target = _launchParams select 0;
_targetLaunchParams = _launchParams select 1;

_shooterPos = getPosASL _shooter;
_projectilePos = getPosASL _projectile;

_distanceToTarget = _projectilePos distance _seekerTargetPos;    
_distanceToShooter = _projectilePos distance _shooterPos;

TRACE_2("", _distanceToTarget, _distanceToShooter);

_addHeight = [0,0,(_projectilePos distance _seekerTargetPos)*0.02];

TRACE_1("", _addHeight);

_seekerTargetPos = _seekerTargetPos vectorAdd _addHeight;

#ifdef DEBUG_MODE_FULL
drawLine3D [(ASLtoATL _seekerTargetPos) vectorAdd _addHeight, ASLtoATL _seekerTargetPos, [0,1,0,1]];
#endif

TRACE_1("Adjusted target position", _seekerTargetPos);
_seekerTargetPos;