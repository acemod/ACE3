#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["ACE_TripodObject", "killed", {
    params ["_tripod"];
    [{deleteVehicle _this}, _tripod, 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
