[
    QGVAR(trackAI),
    "CHECKBOX",
    [LSTRING(TrackAI_DisplayName), LSTRING(TrackAI_Description)],
    LSTRING(Category),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(showCrewKills),
    "CHECKBOX",
    [LSTRING(showCrewKills_DisplayName), LSTRING(showCrewKills_Description)],
    LSTRING(Category),
    false,
    1
] call CBA_fnc_addSetting;
