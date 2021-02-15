[
    QGVAR(thresholdFactor), "SLIDER",
    [LSTRING(ThresholdFactor_DisplayName), LSTRING(ThresholdFactor_Description)],
    [LSTRING(Category), LSTRING(Category_Common)],
    [1, 10, 3, 1], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(taserWorkChance), "SLIDER",
    [LSTRING(TaserWorkChance_DisplayName), LSTRING(TaserWorkChance_Description)],
    [LSTRING(Category), LSTRING(Category_Common)],
    [0, 1, 0.8, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(taserPain), "SLIDER",
    [LSTRING(TaserPain_DisplayName), LSTRING(TaserPain_Description)],
    [LSTRING(Category), LSTRING(Category_Common)],
    [0, 1, 0.2, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call CBA_settings_fnc_init;

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

[
    QGVAR(painSurrenderThreshold), "SLIDER",
    [LSTRING(PainSurrenderThreshold_DisplayName), LSTRING(PainSurrenderThreshold_Description)],
    [LSTRING(Category), LSTRING(Category_AI)],
    [0, 1, 0.8, 3], // [_min, _max, _default, _trailingDecimals]
    true // isGlobal
] call cba_settings_fnc_init;
