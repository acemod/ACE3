private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(EnableFrag), LSTRING(EnableFrag_Desc)],
    [_category, LSTRING(Frag)],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spallEnabled), "CHECKBOX",
    [LSTRING(EnableSpall), LSTRING(EnableSpall_Desc)],
    [_category, LSTRING(Spall)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(reflectionsEnabled), "CHECKBOX",
    [LSTRING(EnableReflections), LSTRING(EnableReflections_Desc)],
    [_category, LSTRING(Reflections)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(fragSimComplexity), "LIST",
     [LSTRING(FragMode), LSTRING(FragMode_Desc)],
    [_category, LSTRING(Frag)],
    [[2, 1, 0], [LSTRING(FragMode_Opt2),LSTRING(FragMode_Opt1),LSTRING(FragMode_Opt0)], 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(atLeastOne), "CHECKBOX",
    [LSTRING(MinFrag), LSTRING(MinFrag_Desc)],
    [_category, LSTRING(Frag)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(blackList), "EDITBOX",
    [LSTRING(DefBlackList), LSTRING(DefBlackList_Desc)],
    [_category, LSTRING(Frag)],
    QUOTE(['B_556x45_Ball']),
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(spallIntensity), "SLIDER",
    [LSTRING(SpallIntensity), LSTRING(SpallIntensity_Desc)],
    [_category, LSTRING(Spall)],
    [0.1, 2, 1, 1],
    1,
    {
        GVAR(shouldSpallCache) = createHashMap;
    }
] call CBA_fnc_addSetting;
