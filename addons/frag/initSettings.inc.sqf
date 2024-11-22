private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(EnableFrag), LSTRING(EnableFrag_Desc)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spallEnabled), "CHECKBOX",
    [LSTRING(EnableSpall), LSTRING(EnableSpall_Desc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
[
    QGVAR(reflectionsEnabled), "CHECKBOX",
    [LSTRING(EnableReflections), LSTRING(EnableReflections_Desc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxTrack), "SLIDER",
    [LSTRING(MaxTrack), LSTRING(MaxTrack_Desc)],
    _category,
    [0, 50, 10, -1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxTrackPerFrame), "SLIDER",
    [LSTRING(MaxTrackPerFrame), LSTRING(MaxTrackPerFrame_Desc)],
    _category,
    [0, 50, 10, -1],
    1
] call CBA_fnc_addSetting;
