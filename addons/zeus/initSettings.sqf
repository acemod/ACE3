[
    QGVAR(zeusAscension),
    "CHECKBOX",
    [LLSTRING(ascension_DisplayName), LLSTRING(ascension_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(zeusBird),
    "CHECKBOX",
    [LLSTRING(bird_DisplayName), LLSTRING(bird_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(remoteWind),
    "CHECKBOX",
    [LLSTRING(remoteWind_DisplayName), LLSTRING(remoteWind_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(radioOrdnance),
    "CHECKBOX",
    [LLSTRING(radioOrdnance_DisplayName), LLSTRING(radioOrdnance_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(revealMines),
    "LIST",
    [LLSTRING(revealMines_DisplayName), LLSTRING(revealMines_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    [
        [
            MINE_REVEAL_NONE,
            MINE_REVEAL_TO_SIDE,
            MINE_REVEAL_FULL
        ],
        [
            localize "STR_A3_OPTIONS_DISABLED",
            LLSTRING(revealMines_partial),
            LLSTRING(revealMines_full)
        ],
        0
    ],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(autoAddObjects),
    "CHECKBOX",
    [LLSTRING(AddObjectsToCurator), LLSTRING(AddObjectsToCurator_desc)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true,
    {},
    true // XEH class EH cannot be removed, requires mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(canCreateZeus),
    "LIST",
    format [LLSTRING(MenuSetting), LLSTRING(CreateZeus)],
    format ["ACE %1", LLSTRING(DisplayName)],
    [
        [
            CAN_CREATE_NONE,
            CAN_CREATE_ADMIN,
            CAN_CREATE_CONSOLE,
            CAN_CREATE_ALL
        ],
        [
            localize "STR_A3_None",
            localize "str_3den_attributes_enabledebugconsole_host_text",
            localize "str_ui_debug_title",
            localize "str_3den_attributes_enabledebugconsole_all_text"
        ],
        0
    ],
    true
] call CBA_fnc_addSetting;
