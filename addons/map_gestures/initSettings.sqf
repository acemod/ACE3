[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_displayName), LSTRING(enabled_description)],
    LSTRING(mapGestures_category),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange), "SLIDER",
    [LSTRING(maxRange_displayName), LSTRING(maxRange_description)],
    LSTRING(mapGestures_category),
    [0,50,7,1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxRangeCamera), "SLIDER",
    [LSTRING(maxRangeCamera_displayName), LSTRING(maxRangeCamera_description)],
    LSTRING(mapGestures_category),
    [0,50,14,1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSpectator), "CHECKBOX",
    [LSTRING(allowSpectator_displayName), LSTRING(allowSpectator_description)],
    LSTRING(mapGestures_category),
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowCurator), "CHECKBOX",
    [LSTRING(allowCurator_displayName), LSTRING(allowCurator_description)],
    LSTRING(mapGestures_category),
    true
] call CBA_fnc_addSetting;

[
    QGVAR(briefingMode), "LIST",
    [LSTRING(briefingMode_displayName), LSTRING(briefingMode_description)],
    LSTRING(mapGestures_category),
    [[0, 1, 2, 3, 4], [LSTRING(briefingMode_All), LSTRING(briefingMode_Group), LSTRING(briefingMode_Side), LSTRING(briefingMode_Proximity), LSTRING(briefingMode_Disabled)], 0]
] call CBA_fnc_addSetting;

[
    QGVAR(onlyShowFriendlys),
    "CHECKBOX",
    [LSTRING(onlyShowFriendlys_displayName), LSTRING(onlyShowFriendlys_description)],
    LSTRING(mapGestures_category),
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(interval), "SLIDER",
    [LSTRING(interval_displayName), LSTRING(interval_description)],
    LSTRING(mapGestures_category),
    [0,1,0.03,2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(nameTextColor), "COLOR",
    [LSTRING(nameTextColor_displayName), LSTRING(nameTextColor_description)],
    [LSTRING(mapGestures_category), LSTRING(mapGestures_subcategory_colors)],
    [0.2,0.2,0.2,0.3],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(defaultLeadColor), "COLOR",
    [LSTRING(defaultLeadColor_displayName), LSTRING(defaultLeadColor_description)],
    [LSTRING(mapGestures_category), LSTRING(mapGestures_subcategory_colors)],
    [1,0.88,0,0.95],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(defaultColor), "COLOR",
    [LSTRING(defaultColor_displayName), LSTRING(defaultColor_description)],
    [LSTRING(mapGestures_category), LSTRING(mapGestures_subcategory_colors)],
    [1,0.88,0,0.7],
    false
] call CBA_fnc_addSetting;
