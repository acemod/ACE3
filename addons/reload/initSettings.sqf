
[
    QGVAR(displayText),
    "CHECKBOX",
    [LSTRING(SettingDisplayTextName), LSTRING(SettingDisplayTextDesc)],
    localize ELSTRING(common,ACEKeybindCategoryWeapons),
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showCheckAmmoSelf),
    "CHECKBOX",
    [LSTRING(SettingShowCheckAmmoSelf), LSTRING(SettingShowCheckAmmoSelfDesc)],
    localize ELSTRING(common,ACEKeybindCategoryWeapons),
    false, // default value
    0 // isGlobal
] call CBA_fnc_addSetting;
