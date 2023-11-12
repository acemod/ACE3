[
    QGVAR(weightCoefficient),
    "SLIDER",
    [LSTRING(weightCoefficient_DisplayName), LSTRING(weightCoefficient_Description)],
    LLSTRING(SettingsName),
    [0, 2, 1, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(dragAndFire),
    "CHECKBOX",
    [LSTRING(DragAndFire_DisplayName), LSTRING(DragAndFire_Description)],
    LLSTRING(SettingsName),
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowRunWithLightweight),
    "CHECKBOX",
    [LSTRING(allowRunWithLightweight_DisplayName), LSTRING(allowRunWithLightweight_Description)],
    LLSTRING(SettingsName),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(skipContainerWeight),
    "CHECKBOX",
    [LSTRING(skipContainerWeight_DisplayName), LSTRING(skipContainerWeight_Description)],
    LLSTRING(SettingsName),
    false,
    true
] call CBA_fnc_addSetting;
