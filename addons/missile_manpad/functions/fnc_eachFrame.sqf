#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Each frame.
 *
 * Arguments:
 * 0: Args <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[]] call ace_missile_manpad_fnc_eachFrame
 *
 * Public: No
 */
params ["_args"];
_args params ["_unit", "_pfid", "_actionId", "_config", "_lockCandidate", "_lockStartTime", "_haveLock", "_lastSound", "_lastSoundTimeout"];
_config params ["_seekerMaxRange", "_lockAngle", "_uncageAngle", "_lockingTimeMin", "_lockingTimeMax", "_lockingSound", "_lockedSound"];

private _fnc_playSound = {
    params ["_sound"];
    if ((_lastSound != _sound) || {CBA_missionTime > _lastSoundTimeout}) then {
        private _affected = (ASLToAGL eyePos _unit) nearEntities ["CAManBase", 50];
        [QGVAR(soundEffect), [_unit, _sound], _affected] call CBA_fnc_targetEvent;
        _args set [7, _sound];
        _args set [8, CBA_missionTime + 10]; // tiny clipping when re-starting track
    };
};

private _fnc_searchTarget = {
    params ["_target", "_currentAngleMax"];

    private _aimASL = aimPos _target;
    private _targetDiff = _aimASL vectorDiff _seekerASL;
    private _angle = acos ((_seekerDir vectorCos _targetDiff) min 1 max -1); // vectorCos will sometimes be 1.0001 :(
    private _visibility = [_source, "VIEW", _target] checkVisibility [_seekerASL, _aimASL];
    private _dist = vectorMagnitude _targetDiff;

    if ((_angle > _currentAngleMax) || {_visibility < 0.1} || {_dist > _seekerMaxRange}) exitWith {
        if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1],
                ASLToAGL _aimASL, 1.5, 1.5, 45, format ["a%1 - v%2 - d%3", _angle, _visibility, _dist], 0.5, 0.025, "TahomaB"];
        };
        0
    };

    private _ret = _visibility // get a signal strength estimate
        * linearConversion [_currentAngleMax/2, _currentAngleMax, _angle, 1, 0.5, true]
        * linearConversion [_seekerMaxRange/2, _seekerMaxRange, vectorMagnitude _targetDiff, 1, 0.5, true]
        * linearConversion [100, 3000, getMass _target, 0.25, 1, true];

    if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
        private _color = [[0,1,0,1], [0,0,1,1]] select isNull (ACE_player getVariable [QEGVAR(missileguidance,target), objNull]);
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", _color,
            ASLToAGL _aimASL, 1.5, 1.5, 45, format ["a%1 - v%2 - d%3 = %4", _angle, _visibility, _dist, _ret], 0.5, 0.025, "TahomaB"];
    };
    _ret
};


if (!GVAR(isLockKeyDown) || {(currentMagazine _unit) == ""}) exitWith {
    "" call _fnc_playSound;
    _unit setVariable [QEGVAR(missileguidance,target), nil];
    _args set [4, objNull]; // _lockCandidate = objNull
};

private _source = _unit;
private _seekerASL = eyePos _source;
private _seekerDir = _source weaponDirection currentWeapon _source;

private _lockFeedback = 0;
if (isNull _lockCandidate) then {
    // find any target within seeker range
    private _potentialTargets = _source nearEntities ["Air", _seekerMaxRange];
    private _bestValue = 0;
    private _bestTarget = objNull;
    {
        private _target = _x;
        if (_target isKindOf "ParachuteBase") then { continue };
        private _strength = [_x, _lockAngle, _seekerMaxRange] call _fnc_searchTarget;
        if (_strength > _bestValue) then {
            _bestTarget = _x;
            _bestValue = _strength;
        };
    } forEach _potentialTargets;
    if (!isNull _bestTarget) then {
        TRACE_1("new target",_bestTarget);
        _args set [4, _bestTarget]; // _lockCandidate = _bestTarget;
        _args set [5, CBA_missionTime]; // _lockStartTime = CBA_missionTime;
        _args set [6, false]; // _haveLock = false;
    };
} else {
    private _angle = [_lockAngle, _uncageAngle] select CBA_events_control;
    private _strength = [_lockCandidate, _angle, _seekerMaxRange] call _fnc_searchTarget;
    if (_strength == 0) exitWith {
        _haveLock = false;
        _args set [4, objNull]; // _lockCandidate = objNull;
    };

    if (_haveLock) then {
        _lockFeedback = 1;
    } else {
        private _lockTime = CBA_missionTime - _lockStartTime;
        private _lockNeeded = linearConversion [1, 0, _strength, _lockingTimeMin, _lockingTimeMax, true];
        _lockFeedback = linearConversion [0, _lockNeeded, _lockTime, 0, 1, true];
        _haveLock = _lockFeedback >= 1;
        if (_haveLock) then {
            TRACE_1("new lock",_strength);
            _args set [6, true];
        };
    };

    // hintSilent format ["lf %1\nstr %2", _lockFeedback, _strength];
};

switch (true) do {
    case (_lockFeedback == 0): { "" call _fnc_playSound };
    case (_lockFeedback < 1): { _lockingSound call _fnc_playSound };
    case (_lockFeedback >= 1): { _lockedSound call _fnc_playSound };
};


if ((isNull _lockCandidate) || {!_haveLock}) then {
    _unit setVariable [QEGVAR(missileguidance,target), nil];
} else {
    _unit setVariable [QEGVAR(missileguidance,target), _lockCandidate];
};
