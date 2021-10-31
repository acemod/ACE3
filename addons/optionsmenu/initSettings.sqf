private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(aceNews)];

[
    QGVAR(showNewsOnMainMenu), "CHECKBOX",
    LSTRING(showNewsOnMainMenu_name),
    _category,
    true,
    0
] call CBA_fnc_addSetting;
