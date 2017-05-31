/*
 * Author: commy2, Phyma
 * Get door animations. @todo rewrite for better custom building support
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
#include "script_component.hpp"

params ["_house", "_door"];

private ["_index", "_animations", "_lockedVariable"];

private _config = _house call CBA_fnc_getObjectConfig;
private _animate = getArray(_config >> "SimpleObject" >> "animate");

_animations = [];
_lockedVariable = [];

{
	_animName = _x select 0;
	if ([toLower _door, _animName] call BIS_fnc_inString) then {
		if (["disabled", _animName] call BIS_fnc_inString || ["locked", _animName] call BIS_fnc_inString) then{
			_LockedVariable pushBack _animName;
		} else {
			_animations pushBack _animName;
		};
	};
} forEach _animate;

[_animations, _lockedVariable]
