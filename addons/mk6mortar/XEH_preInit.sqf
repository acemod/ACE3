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

GVAR(ammoHandlingMagazineReplacement) = createHashMapFromArray [
    ["8Rnd_82mm_Mo_shells", "ACE_1Rnd_82mm_Mo_HE"],
    ["8Rnd_82mm_Mo_Smoke_white", "ACE_1Rnd_82mm_Mo_Smoke"],
    ["8Rnd_82mm_Mo_Flare_white", "ACE_1Rnd_82mm_Mo_Illum"],
    ["8Rnd_82mm_Mo_guided", "ACE_1Rnd_82mm_Mo_HE_Guided"],
    ["8Rnd_82mm_Mo_LG", "ACE_1Rnd_82mm_Mo_HE_LaserGuided"]
];

ADDON = true;
