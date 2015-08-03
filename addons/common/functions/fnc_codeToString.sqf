/*
 * Author: commy2
 *
 * Removes the brackets around a code and returns the code as a string. It does nothing if the code is already a string.
 *
 * Argument:
 * 0: Code (Code or String)
 *
 * Return value:
 * Code (String)
 */
#include "script_component.hpp"

params ["_function"];

if (typeName _function == "STRING") exitWith {_function};

_function = toArray str _function;
_function set [0, -1];
_function set [count _function - 1, -1];
_function = toString (_function - [-1]);
_function
