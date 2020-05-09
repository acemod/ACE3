[
    QGVAR(keepEngineRunning),
    "CHECKBOX",
    [LSTRING(SettingKeepEngineRunningName), LSTRING(SettingKeepEngineRunningDesc)],
    ELSTRING(common,ACEKeybindCategoryVehicles),
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(hideEjectAction),
    "CHECKBOX",
    [LSTRING(HideEjectAction), LSTRING(HideEjectActionTooltip)],
    ELSTRING(common,ACEKeybindCategoryVehicles),
    true,
    2, {
        profileNamespace setVariable [QGVAR(showEjectAction), parseNumber !_this];
        saveProfileNamespace;
    },
    true // needs restart
] call CBA_fnc_addSetting;

[
    QGVAR(speedLimiterStep),
    "SLIDER",
    LSTRING(SpeedLimiterStep),
    ELSTRING(common,ACEKeybindCategoryVehicles),
    [1, 10, 5, 0]
] call CBA_fnc_addSetting;
