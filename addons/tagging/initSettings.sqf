[
    QGVAR(quickTag), "LIST",
    [LLSTRING(QuickTag), LLSTRING(QuickTagDesc)],
    ["ACE Uncategorized", LLSTRING(Tagging)],
    [[0,1,2,3], [LELSTRING(Common,Disabled), LLSTRING(LastUsed), LLSTRING(RandomX), LLSTRING(Random)], 1], // [values, titles, defaultIndex]
    false, // isGlobal
    {[QGVAR(quickTag), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;
