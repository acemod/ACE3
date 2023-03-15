#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// handle GM uniform additional insignia
[QEGVAR(arsenal,displayClosed), {
    EGVAR(arsenal,center) call gm_core_characters_fnc_updateUniformDetails;
}] call CBA_fnc_addEventHandler;

ADDON = true;
