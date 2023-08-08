private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(assignNVG), "CHECKBOX",
    [LSTRING(AssignNVG_DisplayName), LSTRING(AssignNVG_Description)],
    _category,
    false,
    1,
    FUNC(assignNVG)
] call CBA_fnc_addSetting;
