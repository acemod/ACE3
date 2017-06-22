/*
 * Author: Ruthberg
 * Cycles through the range card columns
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_range_card_columns
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(rangeCardCurrentColumn) = (GVAR(rangeCardCurrentColumn) + 1) % (count GVAR(rangeCardLastColumns));

ctrlSetText [5006, (GVAR(rangeCardLastColumns) select GVAR(rangeCardCurrentColumn))];

[] call FUNC(update_range_card);
