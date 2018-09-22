// CBA Settings [ADDON: ace_microdagr]:

[
    QGVAR(mapDataAvailable), "LIST",
    [LSTRING(MapDataAvailable_DisplayName), LSTRING(MapDataAvailable_Description)],
    ["ACE Uncategorized", "MicroDAGR"],
    [[0,1,2],[LSTRING(MapFill_None), LSTRING(MapFill_OnlyRoads), LSTRING(MapFill_Full)],2], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(mapDataAvailable), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // require mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(waypointPrecision), "LIST",
    [LSTRING(WaypointPrecision_DisplayName), LSTRING(WaypointPrecision_Description)],
    ["ACE Uncategorized", "MicroDAGR"],
    [[1, 2, 3], [LSTRING(WaypointPrecision_medium), LSTRING(WaypointPrecision_close), LSTRING(WaypointPrecision_exact)], 2],  // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(waypointPrecision), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // require mission restart
] call cba_settings_fnc_init;
