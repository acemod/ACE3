#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Hellfire attack profile. Handles all 4 modes LOBL, LOAL-DIR, LOAL-HI, LOAL-LO
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
 * [[1,2,3], [], []] call ace_hellfire_fnc_attackProfile
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH", "_launchParams"];
_launchParams params ["","_targetLaunchParams"];
_targetLaunchParams params ["", "", "_launchPos"];
_firedEH params ["","","","","","","_projectile"];

// Get state params:
if (_attackProfileStateParams isEqualTo []) then {
    _this call FUNC(getAttackProfileSettings);
};
_attackProfileStateParams params ["_attackStage", "_configLaunchHeightClear"];


private _projectilePos = getPosASL _projectile;
private _distanceFromLaunch2d = _launchPos distance2d _projectilePos;
private _heightAboveLaunch = (_projectilePos select 2) - (_launchPos select 2);

// Add height depending on distance for compensate
private _returnTargetPos = nil;

switch (_attackStage) do {
    case STAGE_LAUNCH: { // Gain height quickly to pass terrain mask
        _returnTargetPos = _projectilePos getPos [100, getDir _projectile];
        _returnTargetPos set [2, (_projectilePos select 2) + 36.4]; // 100 and 36.4 gives a 20 deg angle

        if (_heightAboveLaunch > _configLaunchHeightClear) then {
            _attackProfileStateParams set [0, STAGE_SEEK_CRUISE];
            TRACE_2("New Stage: STAGE_SEEK_CRUISE",_distanceFromLaunch2d,_heightAboveLaunch);
        };
    };
    case STAGE_SEEK_CRUISE: { // Slowly gain altitude while searching for target
        // Before 4000 cruise at 5.7 degrees up, then level out
        private _cruiseHeight = linearConversion [3000, 5000, _distanceFromLaunch2d, 10, 0, true];

        _returnTargetPos = _projectilePos getPos [100, getDir _projectile];
        _returnTargetPos set [2, (_projectilePos select 2) + _cruiseHeight];

        if (!(_seekerTargetPos isEqualTo [0,0,0])) then {
            _attackProfileStateParams set [0, STAGE_ATTACK_CRUISE];
            TRACE_1("New Stage: STAGE_ATTACK_CRUISE",_distanceFromLaunch2d);
        };
    };
    case STAGE_ATTACK_CRUISE: {
        private _currentHeightOverTarget = (_projectilePos select 2) - (_seekerTargetPos select 2);
        private _distanceToTarget2d = _seekerTargetPos distance2d _projectilePos;
        private _distToGoRatio = _distanceToTarget2d / (_launchPos distance2d _seekerTargetPos);

        // arcing up at 7 degrees to start until 50% left, then smooth curve to a downward attack
        private _gainSlope = linearConversion [0.5, 0.1, _distToGoRatio, 7, -7, true]; 
        _returnTargetPos = +_seekerTargetPos;
        _returnTargetPos set [2, ((_projectilePos select 2) + (_distanceToTarget2d * sin _gainSlope)) max (_seekerTargetPos select 2)];
    
        if ((_distanceToTarget2d < 500) || {(_currentHeightOverTarget atan2 _distanceToTarget2d) > 15}) then { // Wait until we can come down at a sharp angle
            _attackProfileStateParams set [0, STAGE_ATTACK_TERMINAL];
            TRACE_2("New Stage: STAGE_ATTACK_TERMINAL",_distanceToTarget2d,_currentHeightOverTarget);
        };
    };
    case STAGE_ATTACK_TERMINAL: {
        private _distanceToTarget2d = _seekerTargetPos distance2d _projectilePos;
        _returnTargetPos = _seekerTargetPos vectorAdd [0, 0, _distanceToTarget2d * 0.02];
    };
};

// TRACE_1("Adjusted target position", _returnTargetPos);
_returnTargetPos;
