private _category = format ["ACE %1", LLSTRING(Category)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled_DisplayName), LSTRING(Enabled_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;
