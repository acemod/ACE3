
[
    QGVAR(disableNVGsWithSights),
    "CHECKBOX",
    [LSTRING(DisableNVGsWithSights_DisplayName), LSTRING(DisableNVGsWithSights_Description)],
    ELSTRING(Common,ACEKeybindCategoryCommon),
    false,
    { [ACE_player, cameraView] call FUNC(onCameraViewChanged); },
    true
] call CBA_Settings_fnc_init;
