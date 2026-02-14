#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Attempts to hold angle as fed to by seeker. Does so with a simple proportional controller
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_line
 *
 * Public: No
 */
params ["_args", "_timestep", "_seekerTargetPos", "_profileAdjustedTargetPos", "_targetData", "_navigationParams"];
_args params ["_firedEH", "_launchParams", "_flightParams"];
_firedEH params ["","","","","","","_projectile"];
_flightParams params ["_missilePitchRate", "_missileYawRate"];
_launchParams params ["","_targetLaunchParams"];
_targetLaunchParams params ["", "", "_launchPos"];

_navigationParams params ["_pid_pitch", "_pid_yaw", "_launchTime", "_pitchChange", "_yawChange", "_initialPitch", "_initialYaw"];
private _elapsedTime = CBA_missionTime - _launchTime;
private _expectedPitch = _initialPitch + _elapsedTime * _pitchChange;
private _expectedYaw = _initialYaw + _elapsedTime * _yawChange;

private _position = (getPosASLVisual _projectile) vectorDiff _launchPos;

private _distance = 0.01 max vectorMagnitude _position;

_profileAdjustedTargetPos params ["", "", "_heightOffset"];
private _expectedPosition = ([_distance, _expectedYaw, _expectedPitch] call CBA_fnc_polar2vect) vectorAdd [0, 0, _heightOffset];
private _offset = _position vectorDiff _expectedPosition;

private _pitchCommand = _pitchChange + ([_pid_pitch, _offset select 2] call CBA_pid_fnc_update);
private _yawCommand = _yawChange + ([_pid_yaw, -(_offset select 0)] call CBA_pid_fnc_update);

#ifdef DRAW_NLAW_INFO
private _projectilePosition = getPosASLVisual _projectile;
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], [0, 0, 0.75] vectorAdd ASLtoAGL _projectilePosition, 0.75, 0.75, 0, format ["%1", _position], 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], [0, 0, 0.50] vectorAdd ASLtoAGL _projectilePosition, 0.75, 0.75, 0, format ["%1 m/s", vectorMagnitude velocity _projectile], 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], [0, 0, 0.25] vectorAdd ASLtoAGL _projectilePosition, 0.75, 0.75, 0, format ["pCmd [%1] yCmd: [%2]", _pitchCommand, _yawCommand], 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], [0, 0, -0.25] vectorAdd ASLtoAGL _projectilePosition, 0.75, 0.75, 0, format ["%1secs", _elapsedTime], 1, 0.025, "TahomaB"];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], ASLtoAGL (_launchPos vectorAdd _expectedPosition), 0.75, 0.75, 0, format ["Expected Position"], 1, 0.025, "TahomaB"];
drawLine3D [ASLtoAGL _launchPos, ASLtoAGL (_launchPos vectorAdd _expectedPosition), [1, 0, 0, 1], 6];
drawLine3D [ASLtoAGL _projectilePosition, ASLtoAGL (_projectilePosition vectorAdd _offset), [0, 0, 1, 1], 6];

hintSilent format ["pCmd [%1]\nyCmd: [%2]\n\n%3 err\n%4secs", _pitchCommand, _yawCommand, vectorMagnitude _offset, _elapsedTime];
#endif

_projectile vectorModelToWorldVisual [_yawCommand, 0, _pitchCommand]
