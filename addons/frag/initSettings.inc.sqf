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
    QGVAR(enSubMunit), "LIST", 
    ["Enable submunition fragmentation", "Enables submunition fragmentation when fragmentation is enabled"],
    [_category, LSTRING(Frag)],
    [[2, 1, 0], ["complex fragementation","simple fragmentation","no fragmentation"], 2]
] call CBA_fnc_addSetting;

[
    QGVAR(reflectionsEnabled), "CHECKBOX", 
    "Enable reflections",
    [_category, LSTRING(Frag)],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(atLeastOne), "CHECKBOX", 
    "At least one round hit",
    [_category, LSTRING(Frag)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(BlackList), "EDITBOX",
    ["Default BlackList", "Array of ammo classnames strings to blackist fragmentation for."],
    [_category, LSTRING(Frag)],
    QUOTE(['B_556x45_Ball'])
] call CBA_fnc_addSetting;
