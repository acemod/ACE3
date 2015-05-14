/*
 * Author: commy2
 * Opens door
 *
 * Arguments:
 * 0: House <OBJECT>
 * 1: Door <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * [house, "door"] call ace_interaction_fnc_openDoor
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_info", "_animations", "_phase", "_position", "_time", "_usedMouseWheel"];

_info = [2] call FUNC(getDoor);

EXPLODE_2_PVT(_info,_house,_door);

if (isNull _house) exitWith {};

_animations = [_house, _door] call FUNC(getDoorAnimations);

EXPLODE_2_PVT(_animations,_animations,_lockedVariable);

if (count _animations == 0) exitWith {};

if (_house animationPhase (_animations select 0) <= 0 && {_house getVariable [_lockedVariable select 0, 0] == 1}) exitWith {
    _lockedVariable set [0, _house];
    _lockedVariable spawn compile preprocessFileLineNumbers "\A3\Structures_F\scripts\LockedDoor_open.sqf";
};

GVAR(isOpeningDoor) = true;
playSound "ACE_Sound_Click";

[_house, _animations] spawn {
    _house = _this select 0;
    _animations = _this select 1;

    _phase = _house animationPhase (_animations select 0);
    _position = getPosASL ACE_player;

    _time = time + 0.2;
    _usedMouseWheel = false;
    waitUntil {
        if (inputAction "PrevAction" > 0 || {inputAction "NextAction" > 0}) then {
            _usedMouseWheel = true;
        };

        _phase = _phase + (inputAction "PrevAction" / 12) min 1;
        _phase = _phase - (inputAction "NextAction" / 12) max 0;

        {_house animate [_x, _phase]} forEach _animations;

        !GVAR(isOpeningDoor) || {getPosASL ACE_player distance _position > 1}
    };

    if (!_usedMouseWheel && {time < _time} && {[ACE_player, objNull, []] call EFUNC(common,canInteractWith)}) then {
        _phase = [0, 1] select (_house animationPhase (_animations select 0) < 0.5);

        {_house animate [_x, _phase]} forEach _animations;
    };

    GVAR(isOpeningDoor) = false;
};
