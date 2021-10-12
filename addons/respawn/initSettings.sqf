private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(savePreDeathGear), "CHECKBOX",
    [LSTRING(SavePreDeathGear_DisplayName), LSTRING(SavePreDeathGear_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(removeDeadBodiesDisconnected), "CHECKBOX",
    [LSTRING(RemoveDeadBodiesDisconnected_DisplayName), LSTRING(RemoveDeadBodiesDisconnected_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;
