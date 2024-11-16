[
    QXGVAR(settingHint),
    "LIST",
    [LLSTRING(settingHint), LLSTRING(settingHintDesc)],
    LLSTRING(settingsCategory),
    [
        [0, 1, 2],
        [LLSTRING(settingHintNone), LLSTRING(settingHintHasTool), LLSTRING(settingHintEveryone)],
        2
    ]
] call CBA_fnc_addSetting;

[
    QGVAR(timeCostCoefficient),
    "SLIDER",
    [LLSTRING(settingHint_timeCostCoefficient), LLSTRING(settingHintDesc_timeCostCoefficient)],
    LLSTRING(settingsCategory),
    [0, 10, 1, 2], // Min, Max, Default, Trailing Decimals, is Percentage
    true //isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(timeMin),
    "SLIDER",
    [LLSTRING(settingHint_timeMin), LLSTRING(settingHintDesc_timeMin)],
    LLSTRING(settingsCategory),
    [0, 25, 1.5, 2], // Min, Max, Default, Trailing Decimals, is Percentage
    true //isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(markObjectsOnMap),
    "LIST",
    [LLSTRING(markObjectsOnMap), LLSTRING(markObjectsOnMapDesc)],
    LLSTRING(settingsCategory),
    [
        [0, 1, 2],
        [LLSTRING(markObjectsOnMapNone), LLSTRING(markObjectsOnMapFriendly), LLSTRING(markObjectsOnMapEveryone)],
        1
    ],
    true,
    {},
    true
] call CBA_fnc_addSetting;
