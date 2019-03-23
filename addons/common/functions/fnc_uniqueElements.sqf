#include "script_component.hpp"
/*
 * Author: Glowbal
 * Make a copy of an array with only the unique elements.
 *
 * Arguments:
 * 0: array <ARRAY>
 *
 * Return Value:
 * Copy of original array <ARRAY>
 *
 * Example:
 * [[array]] call ace_common_fnc_uniqueElements
 *
 * Public: Yes
 */

params [["_array", [], [[]]]];

_array arrayIntersect _array // return
