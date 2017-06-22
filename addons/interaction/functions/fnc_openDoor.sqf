/*
 * Author: commy2
 * Open door.
 *
 * Arguments:
 * 0: House <OBJECT>
 * 1: Door <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [house, "door"] call ace_interaction_fnc_openDoor
 *
 * Public: No
 */
#include "script_component.hpp"

private _info = [MACRO_DOOR_REACH_DISTANCE] call FUNC(getDoor);

_info params ["_house", "_door"];

if (isNull _house) exitWith {};

private _getDoorAnimations = [_house, _door] call FUNC(getDoorAnimations);

_getDoorAnimations params ["_animations", "_lockedVariable"];

if (_animations isEqualTo []) exitWith {};

//Check if the door can be locked aka have locked variable, otherwhise cant lock it
if (!(isNil (_lockedVariable select 0))) then {
    if ((_house animationPhase (_animations select 0) <= 0) && {_house getVariable [_lockedVariable select 0, 0] == 1}) exitWith {
        _lockedVariable set [0, _house];
        _lockedVariable call BIS_fnc_LockedDoorOpen;
    };
};

playSound "ACE_Sound_Click"; // @todo replace with smth. more fitting

GVAR(doorTargetPhase) = _house animationPhase (_animations select 0);
GVAR(isOpeningDoor) = true;
GVAR(usedScrollWheel) = false;

[{
    (_this select 0) params ["_house", "_animations", "_position", "_time", "_frame"];

    if !(GVAR(isOpeningDoor)) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;

        // didn't use incremental opening. Just do animation normally.
        if !(GVAR(usedScrollWheel)) then {
            private _phase = [0, 1] select (_house animationPhase (_animations select 0) < 0.5);

            {_house animate [_x, _phase]; false} count _animations;
        };
    };

    // check if player moved too far away
    if (getPosASL ACE_player distance _position > 1) exitWith {
        GVAR(isOpeningDoor) = false;
    };

    // this allows for holding the door in it's current state.
    if (CBA_missionTime > _time && {diag_frameno > _frame}) then {
        GVAR(usedScrollWheel) = true;
    };
    // do incremental door opening
    {_house animate [_x, GVAR(doorTargetPhase)]; false} count _animations;
}, 0.1, [_house, _animations, getPosASL ACE_player, CBA_missionTime + 0.2, diag_frameno + 2]] call CBA_fnc_addPerFrameHandler;
