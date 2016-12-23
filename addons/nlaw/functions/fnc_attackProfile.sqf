/*
 * Author: PabstMirror
 * NLAW missile guidance attack profile
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
 * [[1,2,3], [], []] call ace_nlaw_fnc_attackProfile
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH", "_launchParams"];
_launchParams params ["_target","_targetLaunchParams"];
_targetLaunchParams params ["_target", "", "_launchPos"];
_firedEH params ["_shooter","","","","","","_projectile"];

// Get state params:
if (_attackProfileStateParams isEqualTo []) then {
    TRACE_2("start of attack profile",CBA_missionTime,vectorDir _projectile);
    _attackProfileStateParams set [0, CBA_missionTime];

    if (isPlayer _shooter) then {
        TRACE_2("player",GVAR(yawChange),GVAR(pitchChange));
        _attackProfileStateParams set [1, _shooter weaponDirection (currentWeapon _shooter)];
        _attackProfileStateParams set [2, GVAR(yawChange)];
        _attackProfileStateParams set [3, GVAR(pitchChange)];
    } else {
        if ((!isNil "_target") && {!isNull _target}) then {
            private _realLOS = (getPosASL _projectile) vectorFromTo ((aimPos _target) vectorAdd [0,0,1]);
            (((eyePos _shooter) vectorFromTo (aimPos _target)) call CBA_fnc_vect2Polar) params ["", "_startYaw", "_startPitch"];
            (((eyePos _shooter) vectorFromTo ((aimPos _target) vectorAdd ((velocity _target) vectorMultiply (0.8 + random 0.4)))) call CBA_fnc_vect2Polar) params ["", "_predictedYaw", "_predictedPitch"];
            private _yawChange = ([_predictedYaw - _startYaw] call CBA_fnc_simplifyAngle180);
            private _pitchChange = ([_predictedPitch - _startPitch] call CBA_fnc_simplifyAngle180);
            TRACE_4("AI",_target,_realLOS,_yawChange,_pitchChange);
            _attackProfileStateParams set [1, _realLOS];
            _attackProfileStateParams set [2, _yawChange];
            _attackProfileStateParams set [3, _pitchChange];
        } else {
            TRACE_1("AI - no target",_target);
            _attackProfileStateParams set [1, _shooter weaponDirection (currentWeapon _shooter)];
            _attackProfileStateParams set [2, 0];
            _attackProfileStateParams set [3, 0];
        };
    };
};
_attackProfileStateParams params ["_startTime", "_startLOS", "_yawChange", "_pitchChange"];

(_startLOS call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];

private _projectilePos = getPosASL _projectile;
private _distanceFromLaunch = (_launchPos distance _projectilePos) + 10;
private _flightTime = CBA_missionTime - _startTime;

private _realYaw = _yaw + _yawChange * _flightTime;
private _realPitch = _pitch + _pitchChange * _flightTime;

private _returnTargetPos = _launchPos vectorAdd ([_distanceFromLaunch, _realYaw, _realPitch] call CBA_fnc_polar2vect);

#ifdef DRAW_NLAW_INFO
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], ASLtoAGL _launchPos, 0.75, 0.75, 0, "LAUNCH", 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,1,1], ASLtoAGL (_launchPos vectorAdd (_startLOS vectorMultiply (_distanceFromLaunch + 50))), 0.75, 0.75, 0, "Original LOS", 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,0,1], ASLtoAGL (_launchPos vectorAdd ([_distanceFromLaunch + 50, _realYaw, _realPitch] call CBA_fnc_polar2vect)), 0.75, 0.75, 0, format ["Predicted @%1sec",(floor(_flightTime * 10)/10)], 1, 0.025, "TahomaB"];
drawLine3D [ASLtoAGL _launchPos, ASLtoAGL (_launchPos vectorAdd (_startLOS vectorMultiply (_distanceFromLaunch + 50))), [1,0,0,1]];
drawLine3D [ASLtoAGL _launchPos, ASLtoAGL (_launchPos vectorAdd ([_distanceFromLaunch + 50, _realYaw, _realPitch] call CBA_fnc_polar2vect)), [1,1,0,1]];
private _test = lineIntersectsSurfaces [_launchPos, _launchPos vectorAdd (_startLOS vectorMultiply 3000), player, _projectile];
if ((count _test) > 0) then {
    private _posAGL = ASLtoAGL ((_test select 0) select 0);
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], _posAGL, 0.75, 0.75, 0, "Original Impact", 1, 0.025, "TahomaB"];
};
#endif

// TRACE_1("Adjusted target position", _returnTargetPos);
_returnTargetPos;
