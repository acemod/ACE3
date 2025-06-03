[
    QGVAR(enableAction),
    "CHECKBOX",
    LSTRING(enable_action),
    [LSTRING(set_cat_main)],
    true,
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableContextMenu),
    "CHECKBOX",
    LSTRING(enable_contextMenu),
    [LSTRING(set_cat_main)],
    true,
    1,
    LINKFUNC(enableContextMenu)
] call CBA_fnc_addSetting;
