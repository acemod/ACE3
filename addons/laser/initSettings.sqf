private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(laser)];

[
    QGVAR(dispersionCount),  "SLIDER",
    LSTRING(dispersionCount_displayName),
    _category,
    [0, 5, 2, -1],
    1
] call CBA_fnc_addSetting;
