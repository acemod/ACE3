#include "script_component.hpp"

cse_ab_ATragMX_rangeCardCurrentColumn = (cse_ab_ATragMX_rangeCardCurrentColumn + 1) % (count cse_ab_ATragMX_rangeCardLastColumns);

ctrlSetText [5006, (cse_ab_ATragMX_rangeCardLastColumns select cse_ab_ATragMX_rangeCardCurrentColumn)];

call cse_ab_ATragMX_fnc_update_range_card;
