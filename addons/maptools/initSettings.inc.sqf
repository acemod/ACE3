private _category = format ["ACE %1", LLSTRING(Name)];

[
    QGVAR(rotateModifierKey), "LIST",
    [LSTRING(rotateModifierKey_displayName), LSTRING(rotateModifierKey_description)],
    _category,
    [[0, 1, 2, 3], ["STR_A3_OPTIONS_DISABLED", "ALT", "CTRL", "SHIFT"], 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(drawStraightLines), "CHECKBOX",
    [LSTRING(drawStraightLines_displayName), LSTRING(drawStraightLines_description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(plottingBoardAllowChannelDrawing), "LIST",
    [LSTRING(allowChannelDrawing_displayName), LSTRING(allowChannelDrawing_description)],
    _category,
    [[0, 1], [LSTRING(allowDirectCommsOnly), LSTRING(allowDirectGroupComms)], 1],
    0
] call CBA_fnc_addSetting;
