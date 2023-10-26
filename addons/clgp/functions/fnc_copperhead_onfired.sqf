#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Copperhead: Missile Guidance's On fired - set attack profile settings
 *
 * Arguments:
 * Guidance Args <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_clgp_fnc_copperhead_onfired
 *
 * Public: No
 */

params ["_firedEH", "_launchParams", "", "", "_stateParams"];
_launchParams params ["","","","","","_laserInfo"];
_firedEH params ["_shooter","","","","","","_projectile"];
_stateParams params ["", "", "_attackProfileStateParams"];

private _settings = _shooter getVariable [QGVAR(copperhead_settings), COPPERHEAD_DEFUALT_SETTINGS];
_settings params [["_trajectorySetting", 1], ["_delaySetting", 1], ["_laserCodeA", 1], ["_laserCodeB", 1], ["_laserCodeC", 1]];
TRACE_6("",_projectile,_trajectorySetting,_delaySetting,_laserCodeA,_laserCodeB,_laserCodeC);

// Set trajectory and delay from first 2 dials
private _trajectoryBallistic = _trajectorySetting in [1,2]; // 1-2 = ballisitic, any other is shaped
private _delayDeployment = linearConversion [1, 8, _delaySetting, 1, [48, 45] select _trajectoryBallistic, true];

// set var for submuntion's deployCondition
_projectile setVariable [QGVAR(deployTime), _delayDeployment + CBA_missionTime];

_attackProfileStateParams set [0, _trajectoryBallistic];
_attackProfileStateParams set [1, true]; // _checkOrientation

// Set laser guidance info from last 3 dials
// Note: copperhead uses a 3 digit code - techinally 111 should be able to lock onto any X111 4 digit code
// not sure if worth modifying ace_laser for this, for now just assume high digit is 1
private _laserCode = 1000 + 100 * _laserCodeA + 10 * _laserCodeB + _laserCodeC;
_laserInfo set [0, _laserCode];

TRACE_4("copperhead_onfired",_projectile,_trajectoryBallistic,_delayDeployment,_laserCode);
