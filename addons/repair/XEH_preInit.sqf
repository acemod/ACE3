#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["ACE_RepairItem_Base", "killed", {
    params ["_object"];

    [{deleteVehicle _this}, _object, 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
