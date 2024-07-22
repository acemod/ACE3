private _category = [LELSTRING(common,categoryUncategorized), localize "str_dn_parachute"];

[
    QGVAR(hideAltimeter),
    "CHECKBOX",
    [LSTRING(HideAltimeter), LSTRING(HideAltimeter_tooltip)],
    _category,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(failureChance),
    "SLIDER",
    LSTRING(FailureChance),
    _category,
    [0, 1, 0, 2, true],
    1
] call CBA_fnc_addSetting;
