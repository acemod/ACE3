private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(itemName)];

[
    QGVAR(mapDataAvailable), "LIST",
    [LSTRING(MapDataAvailable_DisplayName), LSTRING(MapDataAvailable_Description)],
    _category,
    [[0,1,2],[LSTRING(MapFill_None), LSTRING(MapFill_OnlyRoads), LSTRING(MapFill_Full)],2], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(mapDataAvailable), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // require mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(waypointPrecision), "LIST",
    [LSTRING(WaypointPrecision_DisplayName), LSTRING(WaypointPrecision_Description)],
    _category,
    [[1, 2, 3], [LSTRING(WaypointPrecision_medium), LSTRING(WaypointPrecision_close), LSTRING(WaypointPrecision_exact)], 2],  // [values, titles, defaultIndex]
    true // isGlobal
] call CBA_fnc_addSetting;
