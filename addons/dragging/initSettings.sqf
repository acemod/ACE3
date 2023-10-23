[
    QGVAR(arcadeMode),
    "CHECKBOX",
    [LSTRING(arcadeMode_DisplayName), LSTRING(arcadeMode_Description)],
    LLSTRING(SettingsName),
    false
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
