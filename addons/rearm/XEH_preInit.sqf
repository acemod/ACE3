#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

DFUNC(rearm_statement) = { // moved from config because of build problems
    TRACE_1("rearm_statement",_this);
    {
        if (_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}) then {
            [objNull, _x] call FUNC(rearmEntireVehicleSuccess);
        };
    } forEach (curatorSelected select 0);
};

ADDON = true;
