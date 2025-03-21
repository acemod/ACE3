#include "..\script_component.hpp"
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
private _attackProfilePos = call (missionNamespace getVariable _attackProfileFunction);

if ((isNil "_attackProfilePos") || {_attackProfilePos isEqualTo [0,0,0]}) exitWith {
    // ERROR_2("attack profile [%1] returned bad pos %2",_attackProfileName,_attackProfilePos);
    [0,0,0]
};

if (GVAR(debug_drawGuidanceInfo)) then {
    drawLine3D [(ASLToAGL _attackProfilePos), (ASLToAGL _seekerTargetPos), [0,1,1,1]];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLToAGL _attackProfilePos, 0.5, 0.5, 0, _attackProfileName, 1, 0.025, "TahomaB"];
};

TRACE_2("return",_attackProfilePos,_attackProfileName);
_attackProfilePos;
