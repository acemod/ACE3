#include "script_component.hpp"

GVAR(ATragMX_rangeCardCurrentColumn) = (GVAR(ATragMX_rangeCardCurrentColumn) + 1) % (count GVAR(ATragMX_rangeCardLastColumns));

ctrlSetText [5006, (GVAR(ATragMX_rangeCardLastColumns) select GVAR(ATragMX_rangeCardCurrentColumn))];

[] call FUNC(update_range_card);
