
[
    QGVAR(disableNVGsWithSights),
    "CHECKBOX",
    [LSTRING(DisableNVGsWithSights_DisplayName), LSTRING(DisableNVGsWithSights_Description)],
    ELSTRING(Common,ACEKeybindCategoryCommon),
    false,
    true,
    {
        [ACE_player, cameraView] call FUNC(onCameraViewChanged);
    }
] call CBA_Settings_fnc_init;
