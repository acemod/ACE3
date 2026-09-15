[
    QGVAR(showRangeHint),
    "LIST",
    [LSTRING(showRangeHint)],
    [ELSTRING(common,ACEKeybindCategoryWeapons), QUOTE(COMPONENT_BEAUTIFIED)],
    [[0, 1], [ELSTRING(common,Disabled), ELSTRING(common,Enabled)], 1],
    0 // user setting
] call CBA_fnc_addSetting;
