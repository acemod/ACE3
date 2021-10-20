private _category = format ["ACE %1", localize LSTRING(Category)];
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
