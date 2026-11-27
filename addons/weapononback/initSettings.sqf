[
    QGVAR(enabled), "CHECKBOX",
    LELSTRING(common,Enabled),
    LELSTRING(common,ACEKeybindCategoryWeapons),
    true, false
] call CBA_settings_fnc_init;

[
    QGVAR(renderLimit), "SLIDER",
    [LSTRING(RenderLimit), LSTRING(RenderLimitDescription)],
    LELSTRING(common,ACEKeybindCategoryWeapons),
    [-1, 100, -1, -1], false
] call CBA_settings_fnc_init;
