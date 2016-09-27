#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

["ACE_RepairItem_Base", "killed", {
    params ["_object"];

    [{deleteVehicle _this}, _object, 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
