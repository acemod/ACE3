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

{
    private _animName = toLower _x;
    if ((_animName find (toLower _door)) != -1) then {
        if (((_animName find "disabled") != -1) || ((_animName find "locked") != -1)) then {
            _lockedVariable pushBack _animName;
        } else {
            _animations pushBack _animName;
        };
    };
} forEach _animate;

[_animations, _lockedVariable]
