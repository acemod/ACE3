private _distArr = [
    [0,                      1,     2,      3,      4,      5,      6,      7,      8,      9,      10,     11,     12,     13,     14],
    [LSTRING(videosettings), "500", "1000", "1500", "2000", "2500", "3000", "3500", "4000", "5000", "6000", "7000", "8000", "9000", "10000"],
    0
];

private _categoryStr = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Module_DisplayName),LSTRING(enabled_Description)],
    _categoryStr,
    false,
    false,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(viewDistanceOnFoot),
    "LIST",
    [LSTRING(onFoot_DisplayName),LSTRING(onFoot_Description)],
    _categoryStr,
    _distArr,
    false,
    {[time < 5] call FUNC(adaptViewDistance);} // Do not show prompt during mission start
] call CBA_fnc_addSetting;

[
    QGVAR(viewDistanceLandVehicle),
    "LIST",
    [LSTRING(landVehicle_DisplayName),LSTRING(landVehicle_Description)],
    _categoryStr,
    _distArr,
    false,
    {[time < 5] call FUNC(adaptViewDistance);}
] call CBA_fnc_addSetting;

[
    QGVAR(viewDistanceAirVehicle),
    "LIST",
    [LSTRING(airVehicle_DisplayName),LSTRING(airVehicle_Description)],
    _categoryStr,
    _distArr,
    false,
    {[time < 5] call FUNC(adaptViewDistance);}
] call CBA_fnc_addSetting;

[
    QGVAR(limitViewDistance),
    "SLIDER",
    [LSTRING(limit_DisplayName),LSTRING(limit_setting)],
    _categoryStr,
    [500, 12000, 10000, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(objectViewDistanceCoeff),
    "LIST",
    [LSTRING(object_DisplayName),LSTRING(object_Description)],
    _categoryStr,
    [
        [0,                   1,                       2,                   3,                      4,                    5,                        6                       ],
        [LSTRING(object_off), LSTRING(object_verylow), LSTRING(object_low), LSTRING(object_medium), LSTRING(object_high), LSTRING(object_veryhigh), LSTRING(object_fovBased)],
        0
    ],
    false,
    {[time < 5] call FUNC(adaptViewDistance);}
] call CBA_fnc_addSetting;


