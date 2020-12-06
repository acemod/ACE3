[
    QGVAR(limpChance), "SLIDER",
    [LSTRING(LimpChance_DisplayName), LSTRING(LimpChance_Description)],
    [LSTRING(Category), LSTRING(Category_AI)],
    [0, 1, 0.6, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(limpThreshold), "SLIDER",
    [LSTRING(LimpThreshold_DisplayName), LSTRING(LimpThreshold_Description)],
    [LSTRING(Category), LSTRING(Category_AI)],
    [0, 10, 1, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call cba_settings_fnc_init;

[
    QGVAR(surrenderChance), "SLIDER",
    [LSTRING(SurrenderChance_DisplayName), LSTRING(SurrenderChance_Description)],
    [LSTRING(Category), LSTRING(Category_AI)],
    [0, 1, 0.6, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call cba_settings_fnc_init;

[
    QGVAR(surrenderThreshold), "SLIDER",
    [LSTRING(SurrenderThreshold_DisplayName), LSTRING(SurrenderThreshold_Description)],
    [LSTRING(Category), LSTRING(Category_AI)],
    [0, 10, 3, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call cba_settings_fnc_init;

[
    QGVAR(surrenderCourage), "SLIDER",
    [LSTRING(SurrenderCourage_DisplayName), LSTRING(SurrenderCourage_Description)],
    [LSTRING(Category), LSTRING(Category_AI)],
    [0, 1, 0.25, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call cba_settings_fnc_init;
