#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Cycles through the target size units
 *
 * Arguments:
 * step <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_target_size_units
 *
 * Public: No
 */

GVAR(rangeAssistTargetSizeUnit) = (GVAR(rangeAssistTargetSizeUnit) + 1) % (count GVAR(rangeAssistTargetSizeUnits));
ctrlSetText [7014, GVAR(rangeAssistTargetSizeUnits) select GVAR(rangeAssistTargetSizeUnit)];
