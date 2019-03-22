
[QGVAR(keepEngineRunning), "CHECKBOX",
[LSTRING(SettingKeepEngineRunningName), LSTRING(SettingKeepEngineRunningDesc)],
localize ELSTRING(common,ACEKeybindCategoryVehicles),
true, // default value
true, // isGlobal
{[QGVAR(keepEngineRunning), _this] call EFUNC(common,cbaSettings_settingChanged)}] call CBA_settings_fnc_init;