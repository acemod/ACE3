
[GVAR(waypointPrecision),
"LIST",
[LSTRING(WaypointPrecision_DisplayName), CSTRING(WaypointPrecision_Description)],
"My Category",
[
  [0, 1, 2],
  [CSTRING(WaypointPrecision_medium, CSTRING(WaypointPrecision_close), CSTRING(WaypointPrecision_exact)],
  2]
] call cba_settings_fnc_init;
