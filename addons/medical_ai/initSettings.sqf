[
    QGVAR(enabledFor),
    "CHECKBOX",
    "LIST",
    [LLSTRING(enableFor_title), LLSTRING(enableFor_desc)],
    LLSTRING(settingCategory),
    [
        [0, 1, 2],
        [LELSTRING(Common,Disabled), LLSTRING(enabledFor_OnlyServerAndHC), LELSTRING(Common,Enabled)],
        2
    ],
    true
] call CBA_settings_fnc_init;
