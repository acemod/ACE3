[
    QXGVAR(enable),
    "CHECKBOX",
    [LSTRING(Enable), LSTRING(ModuleDescription)],
    format ["ACE %1", LLSTRING(ModuleDisplayName)],
    true,
    true,
    {[QGVAR(enable), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
