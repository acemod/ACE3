private _category = [ELSTRING(common,ACEKeybindCategoryWeapons), LSTRING(Settings_DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(displayName), LSTRING(description)],
    _category,
    true,
    false,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxCasings), "SLIDER",
    [LSTRING(maxCasings_displayName), LSTRING(maxCasings_description)],
    _category,
    [100, 500, 250, -1],
    false
] call CBA_fnc_addSetting;
