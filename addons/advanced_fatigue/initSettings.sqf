[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(Enabled_Description)],
    LSTRING(DisplayName),
    true,
    true, {
        [QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableStaminaBar),
    "CHECKBOX",
    [LSTRING(EnableStaminaBar), LSTRING(EnableStaminaBar_Description)],
    LSTRING(DisplayName),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fadeStaminaBar),
    "CHECKBOX",
    [LSTRING(FadeStaminaBar), LSTRING(FadeStaminaBar_Description)],
    LSTRING(DisplayName),
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(performanceFactor),
    "SLIDER",
    [LSTRING(PerformanceFactor), LSTRING(PerformanceFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(recoveryFactor),
    "SLIDER",
    [LSTRING(RecoveryFactor), LSTRING(RecoveryFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(loadFactor),
    "SLIDER",
    [LSTRING(LoadFactor), LSTRING(LoadFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(terrainGradientFactor),
    "SLIDER",
    [LSTRING(TerrainGradientFactor), LSTRING(TerrainGradientFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(swayFactor),
    "SLIDER",
    [LSTRING(SwayFactor), LSTRING(SwayFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;
