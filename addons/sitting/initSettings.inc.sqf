[
    QXGVAR(enable),
    "CHECKBOX",
    [LSTRING(Enable), LSTRING(ModuleDescription)],
    [LELSTRING(common,categoryUncategorized), LLSTRING(ModuleDisplayName)],
    true,
    true,
    {[QGVAR(enable), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
