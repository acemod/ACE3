[
    QGVAR(enableGetInMenu),
    "CHECKBOX",
    LSTRING(SettingEnableGetInMenuName),
    format ["ACE %1", LLSTRING(Category)],
    true
] call CBA_settings_fnc_init;
