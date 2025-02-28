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
 * [] call ace_missile_clgp_fnc_copperhead_onfired
 *
 * Public: No
 */

params ["_firedEH", "_launchParams", "", "", "_stateParams"];
_launchParams params ["","","","","","_laserInfo"];
_firedEH params ["_shooter","","","","","","_projectile"];
_stateParams params ["", "", "_attackProfileStateParams"];

(_shooter getVariable [QGVAR(copperhead_settings), COPPERHEAD_DEFUALT_SETTINGS])
    params [["_trajectorySetting", 1], ["_delaySetting", 1], ["_laserCodeA", 1], ["_laserCodeB", 1], ["_laserCodeC", 1]];
TRACE_6("copperhead_onfired",_projectile,_trajectorySetting,_delaySetting,_laserCodeA,_laserCodeB,_laserCodeC);

// Set trajectory from first dial

// Changing path without active feedback causes problems on current missile guidance 
// probably due to poor vector change in ace_missileguidance_fnc_guidancePFH, disable for now
private _trajectoryShaped = _trajectorySetting >= 3; // 1-2 is ballistic, 3-8 is shaped
_attackProfileStateParams set [0, _trajectoryShaped];

// set var for submuntion's deployCondition from second dial
private _delayDeployment = linearConversion [1, 8, _delaySetting, 1, [45, 48] select _trajectoryShaped, true];
_projectile setVariable [QGVAR(deployTime), _delayDeployment + CBA_missionTime];

// Set laser guidance info from last 3 dials
// Note: copperhead uses a 3 digit code - techinally 111 should be able to lock onto any X111 4 digit code
// not sure if worth modifying ace_laser for this, for now just assume high digit is 1
private _laserCode = 1000 + 100 * _laserCodeA + 10 * _laserCodeB + _laserCodeC;
_laserInfo set [0, _laserCode];

TRACE_3("",_trajectoryShaped,_delayDeployment,_laserCode);
