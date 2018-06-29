#include "script_component.hpp"
// Author: Garth 'L-H' de Wet
// Initialises the parachute system.

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(hideAltimeter),
    "CHECKBOX",
    [LSTRING(HideAltimeter), LSTRING(HideAltimeter_tooltip)],
    format ["ACE %1", localize ELSTRING(common,DisplayName)],
    true,
    false,
    {[QGVAR(hideAltimeter), _this, false] call EFUNC(common,cbaSettings_settingChanged)}
] call cba_settings_fnc_init; 

ADDON = true;
