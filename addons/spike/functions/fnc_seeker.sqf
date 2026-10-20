#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Seeker Type: Spike Optical
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_spike_fnc_seeker
 *
 * Public: No
 */

params ["", "_args", "_seekerStateParams", "", "_timestep"];
_args params ["_firedEH", "", "", "_seekerParams", "", "_targetData"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange", "_seekerMinRange"];
_firedEH params ["","","","","","","_projectile"];

(GVAR(projectileHashMap) get hashValue _projectile) params ["_cameraNamespace", "_preTarget"];

private _seekerTargetPos = _cameraNamespace getVariable [QGVAR(seekerTargetPos), [0, 0, 0]];
private _cameraPos = _cameraNamespace getVariable [QGVAR(cameraPos), [0, 0, 0]];
private _logicPos = _cameraNamespace getVariable [QGVAR(logicPos), [0, 0, 0]];

private _seekerTargetInfo = _cameraNamespace getVariable [QGVAR(seekerTargetInfo), [false, [0, 0, 0], [0, 0, 0]]];

private _intersectObject = objNull;
private _designateInput = (_cameraNamespace getVariable [QGVAR(designateInput), [0]]) select 0;

if (_seekerTargetPos isEqualTo [0, 0, 0]) then {
    _seekerTargetPos = _preTarget;
};

if ((_seekerTargetPos isNotEqualTo [0, 0, 0]) || { (_designateInput == 1) }) then {
    _seekerTargetPos = [_cameraPos, vectorNormalized _logicPos, _designateInput, _seekerTargetPos, _projectile] call FUNC(getTargetPosition);
};

_cameraNamespace setVariable [QGVAR(seekerTargetPos), _seekerTargetPos];
_cameraNamespace setVariable [QGVAR(seekerTargetInfo), _seekerTargetInfo];

_seekerStateParams params [["_lastPositions", []], ["_lastAveragePosition", [0, 0, 0]], ["_velocity", [0, 0, 0]], ["_lastTimeCalculated", 0]];
if (5 < count _lastPositions) then {
    private _averagePosition = [0, 0, 0];
    {
        _averagePosition = _averagePosition vectorAdd _x;
    } forEach _lastPositions;

    _averagePosition = _averagePosition vectorMultiply (1 / count _lastPositions);

    if (_lastAveragePosition isNotEqualTo [0, 0, 0]) then {
        private _dt = CBA_missionTime - _lastTimeCalculated;
        if (_dt == 0) then {
            _velocity = [0, 0, 0];
        } else {
            _velocity = (_averagePosition vectorDiff _lastAveragePosition) vectorMultiply (1 / _dt);
            _seekerStateParams set [3, CBA_missionTime];
        }
    };
    _seekerStateParams set [1, _averagePosition];
    _lastPositions = [];
};

_targetData set [0, (getPosASLVisual _projectile) vectorFromTo _seekerTargetPos];
_targetData set [2, (getPosASLVisual _projectile) vectorDistance _seekerTargetPos];
_targetData set [3, _velocity];

_lastPositions pushBack _seekerTargetPos;
_seekerStateParams set [0, _lastPositions];
_seekerStateParams set [2, _velocity];

_seekerTargetPos
