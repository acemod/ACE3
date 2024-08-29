private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(Tagging)];

[
    QGVAR(quickTag), "LIST",
    [LLSTRING(QuickTag), LLSTRING(QuickTagDesc)],
    _category,
    [[0,1,2,3], [LELSTRING(Common,Disabled), LLSTRING(LastUsed), LLSTRING(RandomX), LLSTRING(Random)], 1] // [values, titles, defaultIndex]
] call CBA_fnc_addSetting;
