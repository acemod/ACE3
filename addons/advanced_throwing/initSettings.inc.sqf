private _category = format ["ACE %1", LLSTRING(Category)];
[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enable_DisplayName), LSTRING(Enable_Description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showThrowArc),
    "CHECKBOX",
    [LSTRING(ShowThrowArc_DisplayName), LSTRING(ShowThrowArc_Description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showMouseControls), "CHECKBOX",
    [LSTRING(ShowMouseControls_DisplayName), LSTRING(ShowMouseControls_Description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(enablePickUp), "CHECKBOX",
    [LSTRING(EnablePickUp_DisplayName), LSTRING(EnablePickUp_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enablePickUpAttached), "CHECKBOX",
    [LSTRING(EnablePickUpAttached_DisplayName), LSTRING(EnablePickUpAttached_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableTempWindInfo), "CHECKBOX",
    [LSTRING(EnableTempWindInfo_DisplayName), LSTRING(EnableTempWindInfo_Description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(throwStepSetting), "SLIDER",
    [LSTRING(throwStepSetting_DisplayName), LSTRING(throwStepSetting_Description)],
    _category,
    [1, 12, 8, -1, false],
    0
] call CBA_fnc_addSetting;
