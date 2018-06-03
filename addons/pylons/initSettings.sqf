[
    QGVAR(enabledFromAmmoTrucks),
    "CHECKBOX",
    [LSTRING(EnabledFromAmmoTrucks), LSTRING(EnabledFromAmmoTrucks_description)],
    LSTRING(Category_Pylons),
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enabledForZeus),
    "CHECKBOX",
    [LSTRING(EnabledForZeus), LSTRING(EnabledForZeus_description)],
    LSTRING(Category_Pylons),
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(rearmNewPylons),
    "CHECKBOX",
    [LSTRING(RearmNewPylons), LSTRING(RearmNewPylons_description)],
    LSTRING(Category_Pylons),
    [false],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(requireEngineer),
    "CHECKBOX",
    [LSTRING(RequireEngineer), LSTRING(RequireEngineer_description)],
    LSTRING(Category_Pylons),
    [false],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(requireToolkit),
    "CHECKBOX",
    [LSTRING(RequireToolkit), LSTRING(RequireToolkit_description)],
    LSTRING(Category_Pylons),
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(searchDistance),
    "SLIDER",
    [LSTRING(SearchDistance), LSTRING(SearchDistance_description)],
    LSTRING(Category_Pylons),
    [5, 50, 15, 0],
    true,
    {
        params ["_searchDistance"];
        GVAR(searchDistanceSqr) = _searchDistance ^ 2;
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(timePerPylon),
    "SLIDER",
    [LSTRING(TimePerPylon), LSTRING(TimePerPylon_description)],
    LSTRING(Category_Pylons),
    [1, 10, 5, 0],
    true
] call CBA_Settings_fnc_init;
