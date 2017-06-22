/*
 * Author: Ruthberg
 * Cycles through the num ticks units
 *
 * Arguments:
 * step <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_num_ticks_units
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(speedAssistNumTicksUnit) = (GVAR(speedAssistNumTicksUnit) + 1) % (count GVAR(speedAssistNumTicksUnits));
ctrlSetText [8009, GVAR(speedAssistNumTicksUnits) select GVAR(speedAssistNumTicksUnit)];
call FUNC(calculate_target_speed_assist);
