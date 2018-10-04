#include "script_component.hpp"
/*
 * Author: jaynus / nou, PabstMirror
 * Do attack profile with a valid seeker target location
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_doAttackProfile;
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args"];
_args params ["", "_launchParams"];
_launchParams params ["", "", "", "_attackProfileName"];

private _attackProfileFunction = getText (configFile >> QGVAR(AttackProfiles) >> _attackProfileName >> "functionName");

private _attackProfilePos = _this call (missionNamespace getVariable _attackProfileFunction);

if ((isNil "_attackProfilePos") || {_attackProfilePos isEqualTo [0,0,0]}) exitWith {
    ERROR_1("attack profile returned bad pos",_attackProfilePos);
    [0,0,0]
};

#ifdef DRAW_GUIDANCE_INFO
drawLine3D [(ASLtoAGL _attackProfilePos), (ASLtoAGL _seekerTargetPos), [0,1,1,1]];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLtoAGL _attackProfilePos, 0.5, 0.5, 0, _attackProfileName, 1, 0.025, "TahomaB"];
#endif

TRACE_2("return",_attackProfilePos,_attackProfileName);
_attackProfilePos;
