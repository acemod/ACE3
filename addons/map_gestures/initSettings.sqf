[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(enabled_displayName), LSTRING(enabled_description)],
    localize LSTRING(mapGestures_category),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(onlyShowFriendlys),
    "CHECKBOX",
    [LSTRING(onlyShowFriendlys_displayName), LSTRING(onlyShowFriendlys_description)],
    localize LSTRING(mapGestures_category),
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange),
    "SLIDER",
    [LSTRING(maxRange_displayName), LSTRING(maxRange_description)],
    localize LSTRING(mapGestures_category),
    [0, 50, 7, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(interval),
    "SLIDER",
    [LSTRING(interval_displayName), LSTRING(interval_description)],
    localize LSTRING(mapGestures_category),
    [0, 1, 0.03, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nameTextColor),
    "COLOR",
    [LSTRING(nameTextColor_displayName), LSTRING(nameTextColor_description)],
    localize LSTRING(mapGestures_category),
    [0.2, 0.2, 0.2, 0.3],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(defaultLeadColor),
    "COLOR",
    [LSTRING(defaultLeadColor_displayName), LSTRING(defaultLeadColor_description)],
    localize LSTRING(mapGestures_category),
    [1, 0.88, 0, 0.95],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(defaultColor),
    "COLOR",
    [LSTRING(defaultColor_displayName), LSTRING(defaultColor_description)],
    localize LSTRING(mapGestures_category),
    [1, 0.88, 0, 0.7],
    0
] call CBA_fnc_addSetting;
