#include "script_component.hpp"

GVAR(rangeCardCurrentColumn) = (GVAR(rangeCardCurrentColumn) + 1) % (count GVAR(rangeCardLastColumns));

ctrlSetText [5006, (GVAR(rangeCardLastColumns) select GVAR(rangeCardCurrentColumn))];

[] call FUNC(update_range_card);
