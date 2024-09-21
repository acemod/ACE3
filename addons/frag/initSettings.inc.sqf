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
