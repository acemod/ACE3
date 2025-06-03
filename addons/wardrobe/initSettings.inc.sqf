[
    QGVAR(enableAction),
    "CHECKBOX",
    LSTRING(enable_action),
    [LSTRING(set_cat_main)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableContextMenu),
    "CHECKBOX",
    LSTRING(enable_contextMenu),
    [LSTRING(set_cat_main)],
    true,
    0,
    LINKFUNC(enableContextMenu)
] call CBA_fnc_addSetting;
