[
    QGVAR(enabled), "CHECKBOX",
    [LELSTRING(common,Enabled), LLSTRING(addon_displayname)],
    [ELSTRING(common,ACEKeybindCategoryVehicles), LSTRING(setting_enabled_description)],
    true,
    true,
    {},
    false // Doesn't need full mission restart, but you have to exit and re-enter vic
] call CBA_fnc_addSetting;
