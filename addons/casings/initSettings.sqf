[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(displayName), LSTRING(description)],
    LSTRING(Settings_DisplayName),
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxCasings), "SLIDER",
    [LSTRING(maxCasings_displayName), LSTRING(maxCasings_description)],
    LSTRING(Settings_DisplayName),
    [100, 500, 250, -1],
    true,
    {GVAR(maxCasings) = _this},
    false
] call CBA_fnc_addSetting;
