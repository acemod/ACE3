#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Cycles through the image size units
 *
 * Arguments:
 * step <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_image_size_units
 *
 * Public: No
 */

GVAR(rangeAssistImageSizeUnit) = (GVAR(rangeAssistImageSizeUnit) + 1) % (count GVAR(rangeAssistImageSizeUnits));
ctrlSetText [7015, GVAR(rangeAssistImageSizeUnits) select GVAR(rangeAssistImageSizeUnit)];
