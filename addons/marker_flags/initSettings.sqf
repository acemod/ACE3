private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(DisplayName_Settings)];

[
    QGVAR(placeAnywhere), "CHECKBOX",
    [LSTRING(placeAnywhere_DisplayName), LSTRING(placeAnywhere_Description)],
    _category,
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;
