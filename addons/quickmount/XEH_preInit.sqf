#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(enableGetInMenu),
    "CHECKBOX",
    localize LSTRING(SettingEnableGetInMenuName),
    format ["ACE %1", localize LSTRING(Category)],
    true
] call CBA_settings_fnc_init;

ADDON = true;
