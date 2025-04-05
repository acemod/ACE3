#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Confetti!
 *
 * Arguments:
 * 0: Logo control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_confettiShower
 *
 * Public: No
 */

params ["_logo"];

private _display = ctrlParent _logo;
private _confetti = [];

for "_i" from 1 to 30 do {
    private _ctrl = _display ctrlCreate ["ACE_CtrlConfetti", -1];
    _ctrl ctrlSetPosition [
        getMousePosition#0 - 16 * pixelW,
        getMousePosition#1 - 16 * pixelH,
        32 * pixelW,
        32 * pixelH
    ];
    _ctrl ctrlSetAngle [random 360, 0.5, 0.5];
    _ctrl ctrlCommit 0;

    private _rotation = selectRandom [1, -1] * (360 + random 720);
    private _speed = [[safeZoneW / 2, 0], random 360] call (uiNamespace getVariable "BIS_fnc_rotateVector2D");
    _speed pushBack 0;
    _ctrl setVariable [QGVAR(params), [_rotation, _speed]];

    _confetti pushBack _ctrl;
};

addMissionEventHandler ["EachFrame", {
    _thisArgs params ["_start", "_confetti"];

    private _duration = diag_tickTime - _start;
    if (_duration > 1) exitWith {
        {
            ctrlDelete _x;
        } forEach _confetti;

        removeMissionEventHandler ["EachFrame", _thisEventHandler];
    };

    {
        private _params = _x getVariable [QGVAR(params), [0, [0, 0, 0]]];
        _params params ["_rotation", "_speed"];
        _speed = vectorLinearConversion [0, 1, _duration, _speed, [0, 0.5 * safeZoneH, 0]];

        private _pos = ctrlPosition _x;
        _x ctrlSetPosition (_pos vectorAdd (_speed vectorMultiply diag_deltaTime));
        _x ctrlSetAngle [(ctrlAngle _x)#0 + _rotation * diag_deltaTime, 0.5, 0.5];
        _x ctrlSetFade (_duration / 1);
        _x ctrlCommit 0;
    } forEach _confetti;
}, [diag_tickTime, _confetti]];
