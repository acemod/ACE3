/*
 * Author: esteldunedain
 * Check if the first path is a subpath of the other
 *
 * Arguments:
 * 0: LongPath <ARRAY>
 * 1: ShortPath <STRING>
 *
 * Return Value:
 * Bool
 *
 * Example:
 * [[["ACE_SelfActions", player],["ace_Gestures", player]], [["ACE_SelfActions", player]]] call ace_interact_menu_fnc_isSubPath
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_longPath", "_shortPath"];

private _isSubPath = true;

if (count _shortPath > count _longPath) exitWith {false};

//IGNORE_PRIVATE_WARNING ["_i"];
for [{private _i = 0},{_i < count _shortPath},{_i = _i + 1}] do {
    if !((_longPath select _i) isEqualTo (_shortPath select _i)) exitWith {
        _isSubPath = false;
    };
};

_isSubPath
