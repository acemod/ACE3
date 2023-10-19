private _category = [LELSTRING(common,categoryUncategorized), QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(minDamageToTrigger), "SLIDER",
    LSTRING(minDamageToTrigger_displayName),
    _category,
    [-1, 1, 0.1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(weaponDropEnabled, "CHECKBOX",
    LSTRING(weaponDropEnabled_displayName),
    _category,
    true
] call CBA_fnc_addSetting;
