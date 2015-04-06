#include "script_component.hpp"

GVAR(ATragMX_rangeCardCurrentColumn) = (GVAR(ATragMX_rangeCardCurrentColumn) + 1) % (count GVAR(ATragMX_rangeCardLastColumns));

ctrlSetText [5006, (GVAR(ATragMX_rangeCardLastColumns) select GVAR(ATragMX_rangeCardCurrentColumn))];

call compile preprocessFile ("\atragmx\fnc_update_range_card.sqf");
