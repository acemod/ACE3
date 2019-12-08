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
] call CBA_settings_fnc_init;
