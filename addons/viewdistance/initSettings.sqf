private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_DisplayName), LSTRING(enabled_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(viewDistanceOnFoot), "SLIDER",
    [LSTRING(onFoot_DisplayName), LSTRING(onFoot_Description)],
    _category,
    [0, 10000, 0, -1],
    0,
    {[true] call FUNC(adaptViewDistance)}
] call CBA_fnc_addSetting;

[
    QGVAR(viewDistanceLandVehicle), "SLIDER",
    [LSTRING(landVehicle_DisplayName), LSTRING(landVehicle_Description)],
    _category,
    [0, 10000, 0, -1],
    0,
    {[true] call FUNC(adaptViewDistance)}
] call CBA_fnc_addSetting;

[
    QGVAR(viewDistanceAirVehicle), "SLIDER",
    [LSTRING(airVehicle_DisplayName), LSTRING(airVehicle_Description)],
    _category,
    [0, 10000, 0, -1],
    0,
    {[true] call FUNC(adaptViewDistance)}
] call CBA_fnc_addSetting;

[
    QGVAR(limitViewDistance), "SLIDER",
    [LSTRING(limit_DisplayName), LSTRING(limit_setting)],
    _category,
    [500, 12000, 10000, -1],
    1,
    {[true] call FUNC(adaptViewDistance)}
] call CBA_fnc_addSetting;

[
    QGVAR(objectViewDistanceCoeff), "LIST",
    [LSTRING(object_DisplayName), LSTRING(object_Description)],
    _category,
    [[0, 1, 2, 3, 4, 5, 6], [LSTRING(object_off), LSTRING(object_verylow), LSTRING(object_low), LSTRING(object_medium),LSTRING(object_high), LSTRING(object_veryhigh), LSTRING(object_fovBased)], 0],
    0,
    {[true] call FUNC(adaptViewDistance)}
] call CBA_fnc_addSetting;
