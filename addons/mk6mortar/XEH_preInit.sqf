#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

["Mortar_01_base_F", "Init", { // override CSW's ammo handling with Mk6 setting
    params ["_mortar"];
    _mortar setVariable [QEGVAR(csw,assemblyMode), [0, 3] select GVAR(useAmmoHandling)];
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
