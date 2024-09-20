private _category = [ELSTRING(main,Category_Logistics), LLSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    ELSTRING(common,Enabled),
    _category,
    true,
    true,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(level), "LIST",
    [LSTRING(RearmSettings_level_DisplayName), LSTRING(RearmSettings_level_Description)],
    _category,
    [[0,1,2],[LSTRING(RearmSettings_vehicle), LSTRING(RearmSettings_magazine), LSTRING(RearmSettings_caliber)],0], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(supply), "LIST",
    [LSTRING(RearmSettings_supply_DisplayName), LSTRING(RearmSettings_supply_Description)],
    _category,
    [[0,1,2],[LSTRING(RearmSettings_unlimited), LSTRING(RearmSettings_limited), LSTRING(RearmSettings_magazineSupply)],0], // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(distance), "SLIDER",
    [LLSTRING(RearmSettings_distance_DisplayName), LLSTRING(RearmSettings_distance_Description)],
    _category,
    [10, 50, 20, 0],
    true // isGlobal
] call CBA_fnc_addSetting;
