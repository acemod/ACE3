/*
 * Author: Ruthberg
 * Cycles through the target size units
 *
 * Arguments:
 * step <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_cycle_target_size_units
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(rangeAssistTargetSizeUnit) = (GVAR(rangeAssistTargetSizeUnit) + 1) % (count GVAR(rangeAssistTargetSizeUnits));
ctrlSetText [7014, GVAR(rangeAssistTargetSizeUnits) select GVAR(rangeAssistTargetSizeUnit)];
