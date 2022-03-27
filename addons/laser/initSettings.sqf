private _category = [LELSTRING(common,categoryUncategorized), localize "str_a3_itemtype_laser"];

[
    QGVAR(dispersionCount),  "SLIDER",
    LSTRING(dispersionCount_displayName),
    _category,
    [0, 5, 2, -1],
    1
] call CBA_fnc_addSetting;
