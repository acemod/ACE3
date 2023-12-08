private _category = [ELSTRING(common,ACEKeybindCategoryVehicles), LSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LELSTRING(common,Enabled), LSTRING(Enabled_Tooltip)],
    _category,
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;
