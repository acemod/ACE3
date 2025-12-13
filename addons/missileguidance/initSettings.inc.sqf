[
    QGVAR(chaffEffectivenessCoef),
    "SLIDER",
    [LSTRING(chaffEffectivenessCoef_DisplayName), LSTRING(chaffEffectivenessCoef_Description)],
    LSTRING(Category),
    [0, 2, 1, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(flareAngleCoef),
    "SLIDER",
    [LSTRING(flareAngleCoef_DisplayName), LSTRING(flareAngleCoef_Description)],
    LSTRING(Category),
    [0, 2, 1, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(flareEffectivenessCoef),
    "SLIDER",
    [LSTRING(flareEffectivenessCoef_DisplayName), LSTRING(flareEffectivenessCoef_Description)],
    LSTRING(Category),
    [0, 2, 1, 2],
    true
] call CBA_fnc_addSetting;
