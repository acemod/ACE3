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
