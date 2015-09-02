/*
 * Author: esteldunedain
 * Check if the first path is a subpath of the other
 *
 * Argument:
 * 0: LongPath <ARRAY>
 * 1: ShortPath <STRING>
 *
 * Return value:
 * Bool
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_longPath", "_shortPath"];

private ["_isSubPath","_i"];
_isSubPath = true;

if (count _shortPath > count _longPath) exitWith {false};

for [{_i = 0},{_i < count _shortPath},{_i = _i + 1}] do {
    if !((_longPath select _i) isEqualTo (_shortPath select _i)) exitWith {
        _isSubPath = false;
    };
};

_isSubPath
