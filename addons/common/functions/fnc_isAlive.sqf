/*
 * Author: commy2
 * Check if the object still exists and is alive. This function exists because 'alive objNull' actually returns true.
 *
 * Argument:
 * 0: Any object (Object)
 *
 * Return value:
 * The object exists and is alive (Bool).
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

!isNull (_this select 0) && {alive (_this select 0)}
