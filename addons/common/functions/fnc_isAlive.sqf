/*
 * Author: commy2
 *
 * Check if the object still exists and is alive. This function exists because 'alive objNull' actually returns true.
 *
 * Argument:
 * 0: Any object (Object)
 *
 * Return value:
 * The object exists and is alive (Bool).
 */
#include "script_component.hpp"

params ["_object"];

!isNull (_object) && {alive _object}
