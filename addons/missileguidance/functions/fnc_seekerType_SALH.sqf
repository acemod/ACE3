#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_targets", "_foundTargetPos", "_launchParams", "_seekerParams", "_targetLaunchParams"];

_seekerTargetPos = _this select 0;

_launchParams = _this select 1;
_seekerParams = _launchParams select 3;

// TODO: this needs to be shootCone/findStrongestRay after testing
//_targets = [_projectile, ACE_DEFAULT_LASER_CODE, (_seekerParams select 0)] call ace_laser_fnc_findLaserDesignator;
//_foundTargetPos = getPosASL (_targets select 1);

_laserResult = [(getPosASL _projectile), [1550,1550], 1001] call EFUNC(laser,seekerFindLaserSpot);
_foundTargetPos = _laserResult select 0;
TRACE_1("Search", _laserResult);

// @TODO:  Check angle to target from seeker head


TRACE_1("Seeker return target pos", _foundTargetPos);
_foundTargetPos;