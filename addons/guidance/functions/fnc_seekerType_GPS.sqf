#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 0: Projectile <OBJ>
 * 1: Seeker Search Direction <NUMBER>
 * 2: Seeker Max Angle <NUMBER>
 * 3: Seeker Misc <ARRAY>
 *
 * Return Value:
 * Vector to target position <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_INS;
 *
 * Public: No
 */

params ["_projectile", "_shooter","_extractedInfo"];
_targetInfo params ["_seekerType","_attackProfile","_target","_targetPos","_targetVector","_launchPos", "_miscSeeker", "_miscProfile"];

_miscSeeker params ["_active","_canUpdate","_gpsTargetPos"];

if(!_active) exitWith {_gpsTargetPos};

if(_canUpdate) then {
    private _gpsTargetPos = _shooter getVariable [QGVAR(GPSPos), [0,0,0]];
    if(!(_gpsTargetPos isEqualTo [0,0,0])) then {
        _targetPos = _gpsTargetPos;
    } else {
        _gpsTargetPos = _targetPos;
    };
    
    _miscSeeker set [2, _gpsTargetPos];
    _targetInfo set [6, _miscSeeker];
    _targetInfo set [3, _gpsTargetPos];
};

_targetInfo set [4, (getPosASL _projectile) vectorFromTo _gpsTargetPos];

//_gpsTargetPos;
_targetPos;
