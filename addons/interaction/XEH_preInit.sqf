#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

DFUNC(repair_Statement) = {
    TRACE_1("repairStatement",_this)
    {if (_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}) then {_x setDamage 0}} forEach (curatorSelected select 0)
};

ADDON = true;
