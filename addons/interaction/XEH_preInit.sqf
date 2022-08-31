#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

DFUNC(repair_Statement) = { // moved from config because of build problems
    TRACE_1("repair_Statement",_this);
    {
        if (_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}) then { _x setDamage 0; };
    } forEach (curatorSelected select 0)
};

if (hasInterface) then {
    GVAR(replaceTerrainModels) = createHashMapFromArray call (uiNamespace getVariable QGVAR(cacheReplaceTerrainModels));
};

ADDON = true;
