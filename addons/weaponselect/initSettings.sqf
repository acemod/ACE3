// CBA Settings [ADDON: ace_weaponselect]:

[QGVAR(displayText), "CHECKBOX",
[LSTRING(SettingDisplayTextName), LSTRING(SettingDisplayTextDesc)],
localize ELSTRING(common,ACEKeybindCategoryWeapons),
true, // default value
false, // isGlobal
{[QGVAR(displayText), _this] call EFUNC(common,cbaSettings_settingChanged)}] call CBA_settings_fnc_init;
