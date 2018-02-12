[
    QGVAR(animActionsEnabled),
    "CHECKBOX",
    LSTRING(SettingAnimActionsName),
    format ["ACE %1", localize LSTRING(DisplayName)],
    true,
    true,
    LINKFUNC(switchAnimActions)
] call CBA_settings_fnc_init;
