/*
 * Author: jaynus / nou, PabstMirror
 * Do seeker search
 * Handles a nil/bad return and will attempt to use last known position if enabled on ammo
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 3: Last known pos state array <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_Optic;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["", "_args", "", "_lastKnownPosState"];
_args params ["", "_launchParams"];
_launchParams params ["", "", "_seekerTypeName"];
_lastKnownPosState params ["_seekLastTargetPos", "_lastKnownPos"];

private _seekerFunction = getText (configFile >> QGVAR(SeekerTypes) >> _seekerTypeName >> "functionName");

private _seekerTargetPos = _this call (missionNamespace getVariable _seekerFunction);

if ((isNil "_seekerTargetPos") || {(vectorMagnitude _seekerTargetPos) == 0}) then {
    // Seeker returned nil / bad pos
    if (_seekLastTargetPos && {(vectorMagnitude _lastKnownPos) != 0}) then {
        TRACE_2("seeker returned bad pos - using last known",_seekLastTargetPos,_lastKnownPos);
        _seekerTargetPos = _lastKnownPos;
    } else {
        TRACE_1("seeker returned no pos",_seekerTargetPos);
        _seekerTargetPos = [0,0,0];
    };
} else {
    if (_seekLastTargetPos) then {
        TRACE_1("saving current pos",_seekLastTargetPos);
        _lastKnownPosState set [1, _seekerTargetPos];
    };
};

#ifdef DRAW_GUIDANCE_INFO
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLtoAGL _seekerTargetPos, 0.5, 0.5, 0, _seekerTypeName, 1, 0.025, "TahomaB"];
#endif

TRACE_2("return",_seekerTargetPos,_seekerTypeName);
_seekerTargetPos;
