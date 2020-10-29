#include "script_component.hpp"
/*
 * Author: commy2, Phyma
 * Get door animations.
 *
 * Arguments:
 * 0: House <OBJECT>
 * 1: Door <STRING>
 *
 * Return Value:
 * Animation and Locked variable <ARRAY>
 * 0: Animation <STRING>
 * 1: Locked variable <STRING>
 *
 * Example:
 * array = [target, "door"] call ace_interaction_fnc_getDoorAnimations
 *
 * Public: No
 */

params ["_house", "_door"];

private _animate = animationNames _house;
private _animations = [];
private _lockedVariable = [];
private _numberStrings = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

{
    private _animName = toLower _x;
    private _index = _animName find toLower _door;

    if (_index != -1 && {!(_animName select [_index + count _door, 1] in _numberStrings)}) then {
        if (((_animName find "disabled") != -1) || ((_animName find "locked") != -1)) then {
            _lockedVariable pushBack _animName;
        } else {
            _animations pushBack _animName;
        };
    };
} forEach _animate;

[_animations, _lockedVariable]
