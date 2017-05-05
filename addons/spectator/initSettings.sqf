[
    QGVAR(filterUnits),
    "LIST",
    [LSTRING(units_DisplayName), LSTRING(units_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3],
        [LSTRING(units_none), LSTRING(units_players), LSTRING(units_playable), LSTRING(units_all)],
        2
    ],
    true,
    // This call must have no input argument
    { [] call FUNC(updateUnits) }
] call CBA_Settings_fnc_init;

[
    QGVAR(filterSides),
    "LIST",
    [LSTRING(sides_DisplayName), LSTRING(sides_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3],
        [LSTRING(sides_player), LSTRING(sides_friendly), LSTRING(sides_hostile), LSTRING(sides_all)],
        0
    ],
    true,
    // This call must have no input argument
    { [] call FUNC(updateUnits) }
] call CBA_Settings_fnc_init;

[
    QGVAR(restrictModes),
    "LIST",
    [LSTRING(modes_DisplayName), LSTRING(modes_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3,4],
        [LSTRING(modes_all), LSTRING(modes_unit), LSTRING(modes_free), LSTRING(modes_internal), LSTRING(modes_external)],
        0
    ],
    true,
    {
        private _available = [[0,1,2], [1,2], [0], [1], [2]] select _this;
        [_available, [0,1,2] - _available, true] call FUNC(updateCameraModes);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(restrictVisions),
    "LIST",
    [LSTRING(visions_DisplayName), LSTRING(visions_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3],
        [LSTRING(modes_all), LSTRING(visions_nv), LSTRING(visions_ti), localize "STR_Special_None"],
        0
    ],
    true,
    {
        private _available = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select _this;
        [_available, [-2,-1,0,1] - _available, true] call FUNC(updateVisionModes);
    }
] call CBA_Settings_fnc_init;
