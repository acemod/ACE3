[
    QGVAR(waypointPrecision),
    "LIST",
    [LSTRING(WaypointPrecision_DisplayName), LSTRING(WaypointPrecision_Description)],
    "ACE Uncategorized",
    [[0, 1, 2], [LSTRING(WaypointPrecision_medium), LSTRING(WaypointPrecision_close), LSTRING(WaypointPrecision_exact)], 2],
    true
] call cba_settings_fnc_init;
