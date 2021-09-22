[
    QGVAR(enabled),
    "CHECKBOX",
    [LELSTRING(common,Enabled) /* , LSTRING(todo) */],
    [ELSTRING(common,ACEKeybindCategoryVehicles), LSTRING(DisplayName)],
    true,
    true,
    {},
    false // Doesn't need full mission restart, but you have to exit and re-enter vic
] call CBA_fnc_addSetting;
