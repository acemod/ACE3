[
    QGVAR(enabled), "CHECKBOX",
    [LELSTRING(common,Enabled), LLSTRING(setting_enabled_description)],
    [ELSTRING(common,ACEKeybindCategoryVehicles), LSTRING(addon_displayname)],
    true,
    true,
    {},
    false // Doesn't need full mission restart, but you have to exit and re-enter vic
] call CBA_fnc_addSetting;
