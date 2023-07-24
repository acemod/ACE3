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
    localize LSTRING(SettingsName),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(skipContainerWeight),
    "CHECKBOX",
    [LSTRING(skipContainerWeight_DisplayName), LSTRING(skipContainerWeight_Description)],
    localize LSTRING(SettingsName),
    false,
    true
] call CBA_fnc_addSetting;
