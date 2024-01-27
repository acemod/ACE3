[
    QGVAR(displayText), "CHECKBOX",
    [LSTRING(SettingDisplayTextName), LSTRING(SettingDisplayTextDesc)],
    ELSTRING(common,ACEKeybindCategoryWeapons),
    true, // default value
    false, // isGlobal
    {[QGVAR(displayText), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;
