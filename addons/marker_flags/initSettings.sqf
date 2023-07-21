private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(DisplayName_Settings)];

[
    QGVAR(placeAnywhere), "CHECKBOX",
    [LSTRING(PlaceAnywhere_DisplayName), LSTRING(PlaceAnywhere_Description)],
    _category,
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;
