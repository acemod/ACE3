private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(EnableFrag), LSTRING(EnableFrag_Desc)],
    _category,
    true,
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
    QGVAR(spallEnabled), "CHECKBOX",
    [LSTRING(EnableSpall), LSTRING(EnableSpall_Desc)],
    _category,
    false,
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(spallIntensity), "SLIDER",
    [LSTRING(SpallIntensity), LSTRING(SpallIntensity_Desc)],
    _category,
    [0.1, 2, 1, 1],
    1,
    {
        GVAR(shouldSpallCache) = createHashMap;
    }
] call CBA_fnc_addSetting;
