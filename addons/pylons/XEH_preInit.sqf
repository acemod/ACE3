#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(enabledFromAmmoTrucks),
    "CHECKBOX",
    [localize LSTRING(EnabledFromAmmoTrucks), localize LSTRING(EnabledFromAmmoTrucks_description)],
    localize LSTRING(Category_Pylons),
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enabledForZeus),
    "CHECKBOX",
    [localize LSTRING(EnabledForZeus), localize LSTRING(EnabledForZeus_description)],
    localize LSTRING(Category_Pylons),
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(rearmNewPylons),
    "CHECKBOX",
    [localize LSTRING(RearmNewPylons), localize LSTRING(RearmNewPylons_description)],
    localize LSTRING(Category_Pylons),
    [false],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(requireEngineer),
    "CHECKBOX",
    [localize LSTRING(RequireEngineer), localize LSTRING(RequireEngineer_description)],
    localize LSTRING(Category_Pylons),
    [false],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(requireToolkit),
    "CHECKBOX",
    [localize LSTRING(RequireToolkit), localize LSTRING(RequireToolkit_description)],
    localize LSTRING(Category_Pylons),
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(searchDistance),
    "SLIDER",
    [localize LSTRING(SearchDistance), localize LSTRING(SearchDistance_description)],
    localize LSTRING(Category_Pylons),
    [5, 50, 15, 0],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(timePerPylon),
    "SLIDER",
    [localize LSTRING(TimePerPylon), localize LSTRING(TimePerPylon_description)],
    localize LSTRING(Category_Pylons),
    [1, 10, 5, 0],
    true
] call CBA_Settings_fnc_init;

ADDON = true;
