[
    QGVAR(inventoryDisplaySize),
    "LIST",
    [LSTRING(SettingName), LSTRING(SettingDescription)],
    [LELSTRING(common,categoryUncategorized), localize "str_a3_gear1"],
    [[0, 1, 2], ["str_medium", "str_large", "str_very_large"], 0],
    0
] call CBA_fnc_addSetting;
