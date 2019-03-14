#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(hideEjectAction),
    "CHECKBOX",
    [LSTRING(HideEjectAction), LSTRING(HideEjectActionTooltip)],
    ELSTRING(common,ACEKeybindCategoryVehicles),
    false,
    2, {
        profileNamespace setVariable [QGVAR(showEjectAction), parseNumber !_this];
        saveProfileNamespace;
    }
] call cba_settings_fnc_init;

ADDON = true;
