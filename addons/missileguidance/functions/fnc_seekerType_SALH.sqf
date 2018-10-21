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

params ["", "_args"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["","","","","","_laserParams"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];
_laserParams params ["_code", "_wavelengthMin", "_wavelengthMax"];


private _laserResult = [(getPosASL _projectile), (velocity _projectile), _seekerAngle, _seekerMaxRange, [_wavelengthMin, _wavelengthMax], _code, _projectile] call EFUNC(laser,seekerFindLaserSpot);
private _foundTargetPos = _laserResult select 0;
TRACE_1("Search", _laserResult);

_foundTargetPos;
