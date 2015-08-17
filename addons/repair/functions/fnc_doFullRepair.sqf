/*
 * Author: Glowbal
 *
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * Stuff from progress bar.
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);

_vehicle setDamage 0;
