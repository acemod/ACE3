[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(Enabled_Description)],
    LSTRING(DisplayName),
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enableStaminaBar),
    "CHECKBOX",
    [LSTRING(EnableStaminaBar), LSTRING(EnableStaminaBar_Description)],
    LSTRING(DisplayName),
    true,
    true, {
        if (!_this) then {
            private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
            _staminaBarContainer ctrlSetFade 1;
            _staminaBarContainer ctrlCommit 0;
        };
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(performanceFactor),
    "SLIDER",
    [LSTRING(PerformanceFactor), LSTRING(PerformanceFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(recoveryFactor),
    "SLIDER",
    [LSTRING(RecoveryFactor), LSTRING(RecoveryFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(loadFactor),
    "SLIDER",
    [LSTRING(LoadFactor), LSTRING(LoadFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(terrainGradientFactor),
    "SLIDER",
    [LSTRING(TerrainGradientFactor), LSTRING(TerrainGradientFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(swayFactor),
    "SLIDER",
    [LSTRING(SwayFactor), LSTRING(SwayFactor_Description)],
    LSTRING(DisplayName),
    [0, 5, 1, 1],
    true
] call CBA_Settings_fnc_init;
