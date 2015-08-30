//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_targetPos", "_projectilePos", "_target", "_seekerTargetPos", "_launchParams", "_targetLaunchParams"];
private["_distanceToTarget", "_distanceToShooter", "_addHeight", "_returnTargetPos", "_shooterPos"];
_seekerTargetPos = _this select 0;
_launchParams = _this select 1;

_target = _launchParams select 0;
_targetLaunchParams = _launchParams select 1;

_shooterPos = getPosASL _shooter;
_projectilePos = getPosASL _projectile;

_distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;    
_distanceToShooter = _projectilePos vectorDistance _shooterPos;

TRACE_3("", _distanceToTarget, _distanceToShooter, _seekerTargetPos);

// Add height depending on distance for compensate
_addHeight = [0,0,0];

// Always climb an arc on initial launch if we are close to the round
if( ((ASLtoATL _projectilePos) select 2) < 5 && _distanceToShooter < 15) then {
        _addHeight = _addHeight vectorAdd [0,0,_distanceToTarget];
} else {
    // If we are below the target, increase the climbing arc
    if((_projectilePos select 2) < (_seekerTargetPos select 2) && _distanceToTarget > 100) then {
        _addHeight = _addHeight vectorAdd [0,0, ((_seekerTargetPos select 2) - (_projectilePos select 2))];
    };
};

// Handle arcing terminal low for high decent
if( (_projectilePos select 2) > (_seekerTargetPos select 2) && _distanceToTarget < 100) then {
    _addHeight = _addHeight vectorDiff [0,0, ((_projectilePos select 2) - (_seekerTargetPos select 2)) * 0.5];
} else {
    if((_projectilePos select 2) > (_seekerTargetPos select 2) && _distanceToTarget > 100) then {
        _addHeight = _addHeight vectorAdd [0,0, _distanceToTarget*0.02];
    };
};

_returnTargetPos = _seekerTargetPos vectorAdd _addHeight;

#ifdef DEBUG_MODE_FULL
drawLine3D [(ASLtoATL _returnTargetPos) vectorAdd _addHeight, ASLtoATL _returnTargetPos, [0,1,0,1]];
#endif

TRACE_1("Adjusted target position", _returnTargetPos);
_returnTargetPos;