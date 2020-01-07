#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: SALH (Laser)
 * Wrapper for ace_laser_fnc_seekerFindLaserSpot
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_SALH;
 *
 * Public: No
 */
params ["_projectile", "_shooter","_extractedInfo"];
_extractedInfo params ["_seekerType","_attackProfile","_target","_targetPos","_targetVector","_launchPos", "_miscSeeker", "_miscProfile"];
_miscSeeker params ["_active","_laserInfo"];
_laserInfo params ["_laserCode", "_wavelengthMin", "_wavelengthMax"];

if(!_active) exitWith {[0,0,0]};

_projPos = getPosASL _projectile;

_seekerAngle = 10;
_seekerMaxRange = 3000;

//Needs fix for off-axis search
private _laserResult = [(_projPos), (_targetVector), _seekerAngle, _seekerMaxRange, [_wavelengthMin, _wavelengthMax], _laserCode, _projectile] call EFUNC(laser,seekerFindLaserSpot);

_extractedInfo set [3, _laserResult select 0];
_extractedInfo set [2,_laserResult select 1];
_extractedInfo set [4, _projPos vectorFromTo (_laserResult select 0)];

if(((_laserResult select 0) isEqualTo [0,0,0]) && (isNull _laserResult select 1)) then {
    _extractedInfo set [4, vectorNormalized (velocity _projectile)];
};

_laserResult select 0;
