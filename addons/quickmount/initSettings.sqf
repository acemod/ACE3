[
    QGVAR(enabled),
    "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(EnabledDescription)],
    format ["ACE %1", LLSTRING(Category)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(distance),
    "SLIDER",
    [LSTRING(Distance), LSTRING(DistanceDescription)],
    format ["ACE %1", LLSTRING(Category)],
    [0, 10, DEFAULT_DISTANCE, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(speed),
    "SLIDER",
    [LSTRING(Speed), LSTRING(SpeedDescription)],
    format ["ACE %1", LLSTRING(Category)],
    [0, 30, DEFAULT_SPEED, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(priority),
    "LIST",
    [LSTRING(Priority), LSTRING(PriorityDescription)],
    format ["ACE %1", LLSTRING(Category)],
    [[0, 1, 2, 3], ["str_getin_pos_driver", "str_getin_pos_gunn", "str_getin_pos_comm", "str_getin_pos_passenger"], DEFAULT_PRIORITY],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(enableMenu),
    "LIST",
    ELSTRING(interact_menu,Category_InteractionMenu),
    format ["ACE %1", LLSTRING(Category)],
    [
        [0,1,2,3],
        [
            "STR_A3_None",
            "STR_rscMenu.hppRscGroupRootMenu_Items_GetIn1",
            LSTRING(ChangeSeat),
            "str_word_all"
        ],
        3
    ]
] call CBA_settings_fnc_init;
