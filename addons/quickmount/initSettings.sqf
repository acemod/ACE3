[
    QGVAR(enabled),
    "CHECKBOX",
    localize ELSTRING(common,Enabled),
    format ["ACE %1", localize LSTRING(Category)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(distance),
    "SLIDER",
    [localize LSTRING(Distance), localize LSTRING(DistanceDescription)],
    format ["ACE %1", localize LSTRING(Category)],
    [0, 10, DEFAULT_DISTANCE, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(speed),
    "SLIDER",
    [localize LSTRING(Speed), localize LSTRING(SpeedDescription)],
    format ["ACE %1", localize LSTRING(Category)],
    [0, 30, DEFAULT_SPEED, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(priority),
    "LIST",
    [localize LSTRING(Priority), localize LSTRING(PriorityDescription)],
    format ["ACE %1", localize LSTRING(Category)],
    [[0, 1, 2, 3], [localize "str_getin_pos_driver", localize "str_getin_pos_gunn", localize "str_getin_pos_comm", localize "str_getin_pos_passenger"], DEFAULT_PRIORITY],
    false
] call CBA_settings_fnc_init;

