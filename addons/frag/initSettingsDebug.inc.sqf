private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(debugOptions), "CHECKBOX",
    [LSTRING(EnableDebugTrace), LSTRING(EnableDebugTrace_Desc)],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(dbgSphere), "CHECKBOX",
    [LSTRING(HitSphereEnable), LSTRING(HitSphereEnable_Desc)],
    [_category, LSTRING(Debug)],
    false,
    0,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(drawHitBox),"CHECKBOX",
    [LSTRING(DrawHitBox), LSTRING(DrawHitBox_Desc)],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;