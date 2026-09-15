[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(Enabled_Description)],
    LSTRING(DisplayName),
    true,
    1,
    {
        call FUNC(updateStaminaBar);
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
    1,
    {call FUNC(updateStaminaBar)}
] call CBA_fnc_addSetting;

[
    QGVAR(fadeStaminaBar),
    "CHECKBOX",
    [LSTRING(FadeStaminaBar), LSTRING(FadeStaminaBar_Description)],
    LSTRING(DisplayName),
    true,
    0,
    {
        if (!_this && GVAR(enabled) && GVAR(enableStaminaBar)) then {
            private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
            _staminaBarContainer ctrlSetFade 0;
            _staminaBarContainer ctrlCommit 0;
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(performanceFactor),
    "SLIDER",
    [LSTRING(PerformanceFactor), LSTRING(PerformanceFactor_Description)],
    LSTRING(DisplayName),
    [0, MAX_PERFORMANCE_FACTOR, 1, 2],
    1,
    {
        // Recalculate values if the setting is changed mid-mission
        if (GVAR(enabled) && hasInterface && !isNull ACE_player) then {
            [ACE_player, ACE_player] call FUNC(handlePlayerChanged);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(recoveryFactor),
    "SLIDER",
    [LSTRING(RecoveryFactor), LSTRING(RecoveryFactor_Description)],
    LSTRING(DisplayName),
    [0, 10, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(loadFactor),
    "SLIDER",
    [LSTRING(LoadFactor), LSTRING(LoadFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(terrainGradientFactor),
    "SLIDER",
    [LSTRING(TerrainGradientFactor), LSTRING(TerrainGradientFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;
