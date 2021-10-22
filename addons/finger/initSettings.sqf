private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_displayName), LSTRING(enabled_description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange), "SLIDER",
    [LSTRING(maxRange_displayName), LSTRING(maxRange_description)],
    _category,
    [0, 50, 4, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(indicatorForSelf), "CHECKBOX",
    [LSTRING(indicatorForSelf_name), LSTRING(indicatorForSelf_description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(indicatorColor), "COLOR",
    [LSTRING(indicatorColor_name), LSTRING(indicatorColor_description)],
    _category,
    [0.83, 0.68, 0.21, 0.75],
    0
] call CBA_fnc_addSetting;
