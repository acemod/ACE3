
[
    QGVAR(keepEngineRunning),
    "CHECKBOX",
    [LSTRING(SettingKeepEngineRunningName), LSTRING(SettingKeepEngineRunningDesc)],
    localize ELSTRING(common,ACEKeybindCategoryVehicles),
    false, // default value
    true // isGlobal
] call CBA_settings_fnc_init;
