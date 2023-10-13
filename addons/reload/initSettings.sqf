[
    QGVAR(displayText),
    "CHECKBOX",
    [LSTRING(SettingDisplayTextName), LSTRING(SettingDisplayTextDesc)],
    ELSTRING(common,ACEKeybindCategoryWeapons),
    true // default value
] call CBA_fnc_addSetting;

[
    QGVAR(showCheckAmmoSelf),
    "CHECKBOX",
    [LSTRING(SettingShowCheckAmmoSelf), LSTRING(SettingShowCheckAmmoSelfDesc)],
    ELSTRING(common,ACEKeybindCategoryWeapons),
    false // default value
] call CBA_fnc_addSetting;
