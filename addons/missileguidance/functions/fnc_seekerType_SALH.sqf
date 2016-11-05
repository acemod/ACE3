// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_lastSeekTargetPos", "_args"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];
_launchParams params ["","","","","","_laserParams"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];
_laserParams params ["_code", "_wavelengthMin", "_wavelengthMax"];

private "_foundTargetPos";

if (!isNil "_target") then {
    // Handle AI or moving vanilla lasers
    _foundTargetPos = getPosASL _target;
} else {
    private _laserResult = [(getPosASL _projectile), (velocity _projectile), _seekerAngle, [_wavelengthMin, _wavelengthMax], _code, _projectile] call EFUNC(laser,seekerFindLaserSpot);
    _foundTargetPos = _laserResult select 0;
    TRACE_1("Search", _laserResult);
};

if(!isNil "_foundTargetPos") then {
    // Fov is already checked by laser func, check if distance
    
    private _canSeeTarget = _seekerMaxRange >= (_foundTargetPos vectorDistance (getPosASL _projectile));
    // If we got here, it was an invalid target, just return a spot 5m in front of the missile
    if(!_canSeeTarget) then { 
        _foundTargetPos = _sensorPos vectorAdd ((velocity _projectile) vectorMultiply 5);
    };
};

_foundTargetPos;
