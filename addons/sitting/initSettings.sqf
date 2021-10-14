[
    QXGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enable), LSTRING(ModuleDescription)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    true,
    true,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_fnc_addSetting;
