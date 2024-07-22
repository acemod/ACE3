#include "..\script_component.hpp"
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

private _info = [MACRO_DOOR_REACH_DISTANCE] call FUNC(getDoor);

_info params ["_house", "_door"];
TRACE_2("openDoor",_house,_door);

if (isNull _house) exitWith {};

if ((configProperties [configOf _house >> "UserActions"]) isEqualTo []) exitWith {
    TRACE_1("Ignore houses with no UserActions",typeOf _house); // Fix problem with Shoothouse Walls
};

private _getDoorAnimations = [_house, _door] call FUNC(getDoorAnimations);

_getDoorAnimations params ["_animations"];

if (_animations isEqualTo []) exitWith {};

private _lockedVariable = format ["bis_disabled_%1", _door];
private _lockedVariableAlt = _lockedVariable; // GM Buildings may have door names like door_01 but locking expects door_1
if ((count _door == 7) && {(_door select [0, 6]) == "door_0"}) then {
    _lockedVariableAlt = format ["bis_disabled_door_%1", _door select [6, 1]]; // stip off the leading zero then check both vars
};

// Check if the door can be locked aka have locked variable, otherwhise cant lock it
if ((_house animationPhase (_animations select 0) <= 0) &&
    {(_house getVariable [_lockedVariable, 0] == 1) || {_house getVariable [_lockedVariableAlt, 0] == 1}}) exitWith {
    private _lockedAnimation = format ["%1_locked_source", _door];
    TRACE_3("locked",_house,_lockedAnimation,isClass (configOf _house >> "AnimationSources" >> _lockedAnimation));
    if (isClass (configOf _house >> "AnimationSources" >> _lockedAnimation)) then {
        // from: a3\structures_f\scripts\fn_door.sqf: - wiggles the door handle (A3 buildings)
        _house animateSource [_lockedAnimation, (1 - (_house animationSourcePhase _lockedAnimation))];
    };
};

// Add handle on carrier
if (typeOf _house == "Land_Carrier_01_island_01_F") then {
    private _handle = format ["door_handle_%1_rotate_1", (_animations select 0) select [5, 1]];
    TRACE_1("carrier handle",_handle);
    _animations pushBack _handle;
};

playSound "ACE_Sound_Click"; // @todo replace with smth. more fitting

GVAR(doorTargetPhase) = _house animationPhase (_animations select 0);
GVAR(isOpeningDoor) = true;
GVAR(usedScrollWheel) = false;

// Raise local started opening event
[QGVAR(doorOpeningStarted), [_house, _door, _animations]] call CBA_fnc_localEvent;

[{
    (_this select 0) params ["_house", "_animations", "_position", "_time", "_frame", "_door"];

    if !(GVAR(isOpeningDoor)) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;

        // didn't use incremental opening. Just do animation normally.
        if !(GVAR(usedScrollWheel)) then {
            private _phase = parseNumber (_house animationPhase (_animations select 0) < 0.5);

            {_house animate [_x, _phase]} forEach _animations;
        };

        // Raise local stopped opening event
        [QGVAR(doorOpeningStopped), [_house, _door, _animations]] call CBA_fnc_localEvent;
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
    {_house animate [_x, GVAR(doorTargetPhase)]} forEach _animations;
}, 0.1, [_house, _animations, getPosASL ACE_player, CBA_missionTime + 0.2, diag_frameno + 2, _door]] call CBA_fnc_addPerFrameHandler;
