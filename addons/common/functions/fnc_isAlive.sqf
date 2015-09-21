/*
 * Author: commy2
 * Check if the object still exists and is alive. This function exists because 'alive objNull' actually returns true.
 *
 * Argument:
 * 0: Any object <OBJECT>
 *
 * Return value:
 * The object exists and is alive <BOOL>.
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

params ["_unit"];

!isNull _unit && {alive _unit} // return
