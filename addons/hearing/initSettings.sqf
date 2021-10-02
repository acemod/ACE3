private _category = format ["ACE %1", LLSTRING(DisplayName)];

[
    QGVAR(singleUse),
    "CHECKBOX",
    [LSTRING(singleUse_DisplayName), LSTRING(singleUse_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
