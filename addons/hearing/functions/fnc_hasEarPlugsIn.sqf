/*
 * Author: commy2
 *
 * Check if the unit has earplugs put in.
 *
 * Argument:
 * A soldier (Object)
 *
 * Return value:
 * Boolean (Bool)
 */
#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

_unit getVariable ["ACE_hasEarPlugsin", false]
