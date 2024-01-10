private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(debugOptions), "CHECKBOX",
    [LSTRING(EnableDebugTrace), LSTRING(EnableDebugTrace_Desc)],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

//*** debug options ***//
[
    QGVAR(dbgSphere), "CHECKBOX",
    [LSTRING(HitSphereEnable), LSTRING(HitSphereEnable_Desc)],
//    "Create color coded spheres at ",
    [_category, LSTRING(Debug)],
    false,
    0,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(drawHitBox),"CHECKBOX",
    [LSTRING(DrawHitBox), LSTRING(DrawHitBox_Desc)],
//    ["Draw unit hitboxes", "Draw added hitboxes each frame"],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;