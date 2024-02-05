private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(DisplayName_Settings)];

[
    QGVAR(swapGunbagEnabled), "CHECKBOX",
    [LSTRING(SwapGunbagEnabled_DisplayName), LSTRING(SwapGunbagEnabled_Description)],
    _category,
    true, // default value
    true // isGlobal
] call CBA_fnc_addSetting;
