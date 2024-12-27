private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(setting_categoryMenu_displayName)];

[
    QGVAR(requireRopeItems), "CHECKBOX",
    [LSTRING(setting_requireRopeItems_displayName)],
    _category,
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(autoAddFRIES), "CHECKBOX",
    [LSTRING(setting_autoAddFRIES_displayName), LSTRING(setting_autoAddFRIES_description)],
    _category,
    false, // default value
    true // isGlobal
] call CBA_fnc_addSetting;
