/*
 * Author: commy2
 * Removes the brackets around a code and returns the code as a string. It does nothing if the code is already a string.
 *
 * Arguments:
 * 0: Code <CODE, STRING>
 *
 * Return value:
 * Code <STRING>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_function"];

if (_function isEqualType "") exitWith {_function};

_function = toArray str _function;
_function deleteAt 0;
_function deleteAt (count _function - 1);

toString _function // return
