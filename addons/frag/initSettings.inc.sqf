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

/// !*! TODO: add stringtable entries
[
    QGVAR(fragSimComplexity), "LIST", 
     [LSTRING(FragMode), LSTRING(FragMode_Desc)],
//    ["Fragmentation mode", "Sets how fragments are generated"],
    [_category, LSTRING(Frag)],
    [[2, 1, 0], [LSTRING(FragMode_Opt2),LSTRING(FragMode_Opt1),LSTRING(FragMode_Opt0)], 2],
//    [[2, 1, 0], ["Targeted & random fragmentation","Random fragmentation","Unit targeted fragmentation"], 2],
	true
] call CBA_fnc_addSetting;

[
    QGVAR(atLeastOne), "CHECKBOX", 
    [LSTRING(MinFrag), LSTRING(MinFrag_Desc)],
//    ["At least one round hit", "Spawn at least one fragment for units in fragmentation range, up to maximum fragments"],
    [_category, LSTRING(Frag)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(BlackList), "EDITBOX",
    [LSTRING(DefBlackList), LSTRING(DefBlackList_Desc)],
//    ["Fragmentation BlackList", "Array of ammo classnames strings to blackist fragmentation for."],
    [_category, LSTRING(Frag)],
    QUOTE(['B_556x45_Ball']),
	true,
	nil,
	true
] call CBA_fnc_addSetting;

[
    QGVAR(SpallIntensity), "SLIDER",
    [LSTRING(SpallIntensity), LSTRING(SpallIntensity_Desc)],
    [_category, LSTRING(Spall)],
    [0.1, 2, 1, 1],
	true
] call CBA_fnc_addSetting;
