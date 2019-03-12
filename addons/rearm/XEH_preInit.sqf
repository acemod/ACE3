#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

DFUNC(rearm_statement) = {
    {
        if (_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}) then {
            [objNull, _x] call ace_rearm_fnc_rearmEntireVehicleSuccess;
        };
    } forEach (curatorSelected select 0);
};

ADDON = true;
