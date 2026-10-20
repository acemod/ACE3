private _category = format ["ACE %1", LLSTRING(Module_DisplayName)];

[
    QGVAR(debugOptions),
    "CHECKBOX",
    [LSTRING(EnableDebugTrace), LSTRING(EnableDebugTrace_Desc)],
    [_category, ELSTRING(common,Debug)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(dbgSphere),
    "CHECKBOX",
    [LSTRING(HitSphereEnable), LSTRING(HitSphereEnable_Desc)],
    [_category, ELSTRING(common,Debug)],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(drawHitBox),
    "CHECKBOX",
    [LSTRING(DrawHitBox), LSTRING(DrawHitBox_Desc)],
    [_category, ELSTRING(common,Debug)],
    true
] call CBA_fnc_addSetting;
