private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(debugOptions), "CHECKBOX",
 // [LSTRING(DebugEnable), LSTRING(DebugEnable_Desc)]
    ["Enable debug mode", "Enable debug tracing and spheres"],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

// debug options
[
    QGVAR(dbgSphere), "CHECKBOX",
 // [LSTRING(DebugEnable), LSTRING(DebugEnable_Desc)]
    "Create color coded spheres at ",
    [_category, LSTRING(Debug)],
    false,
    0,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(frameHint), "CHECKBOX",
 // [LSTRING(FrameHint), LSTRING(FrameHint_Desc)]
    ["Show framerate hint", "Show 1/diag_frameTime as a hint"],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fadeRounds), "CHECKBOX",
 // [LSTRING(FadeRounds), LSTRING(FadeRounds_Desc)]
    ["Fade round traces over time", "Fade round traces for added round over time"],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(dltTrace), "CHECKBOX", 
 // [LSTRING(FadeRounds), LSTRING(FadeRounds_Desc)]
	["Delete fire trace on fade", "Delete faded traces"],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(drawHitBox),"CHECKBOX",
 // [LSTRING(DrawHitBox), LSTRING(DrawHitBox_Desc)]
    ["Draw unit hitboxes", "Draw added hitboxes each frame"],
    [_category, LSTRING(Debug)],
    true
] call CBA_fnc_addSetting;

