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
    ["ACE Uncategorized", localize "str_dn_parachute"],
    true,
    false,
    {[QGVAR(hideAltimeter), _this, false] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(failureChance),
    "SLIDER",
    LSTRING(FailureChance),
    ["ACE Uncategorized", localize "str_dn_parachute"],
    [0, 1, 0, 2, true],
    1
] call CBA_fnc_addSetting;

ADDON = true;
