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
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(showMedicalWounds),
    "LIST",
    [LSTRING(showMedicalWounds_DisplayName)],
    LSTRING(Category),
    [[0, 1, 2], [LELSTRING(common,Disabled), LELSTRING(common,playerOnly), LELSTRING(common,playersAndAI)], 2], //  [_values, _valueTitles, _defaultIndex]
    1
] call CBA_fnc_addSetting;
