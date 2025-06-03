[
    QGVAR(enableAction),
    "CHECKBOX",
    LSTRING(enable_action),
    [LSTRING(setting_category)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableContextMenu),
    "CHECKBOX",
    LSTRING(enable_contextMenu),
    [LSTRING(setting_category)],
    true,
    0,
    LINKFUNC(enableContextMenu)
] call CBA_fnc_addSetting;
