#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Override CSW's ammo handling with Mk6 setting for non-advanced assembly mortars
["Mortar_01_base_F", "Init", {
    params ["_mortar"];
    if (GVAR(useAmmoHandling)) exitWith {};
    if ((_mortar getVariable [QEGVAR(csw,assemblyMode), 3]) isEqualTo 3) then {
        _mortar setVariable [QEGVAR(csw,assemblyMode), 0];
    };
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
