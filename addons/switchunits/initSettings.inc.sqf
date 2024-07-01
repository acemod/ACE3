private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(enableSwitchUnits), "CHECKBOX",
    LSTRING(EnableSwitchUnits_DisplayName),
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(switchToWest), "CHECKBOX",
    [LSTRING(SwitchToWest_DisplayName), LSTRING(SwitchToWest_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(switchToEast), "CHECKBOX",
    [LSTRING(SwitchToEast_DisplayName), LSTRING(SwitchToEast_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(switchToIndependent), "CHECKBOX",
    [LSTRING(SwitchToIndependent_DisplayName), LSTRING(SwitchToIndependent_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(switchToCivilian), "CHECKBOX",
    [LSTRING(SwitchToCivilian_DisplayName), LSTRING(SwitchToCivilian_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableSafeZone), "CHECKBOX",
    [LSTRING(EnableSafeZone_DisplayName), LSTRING(EnableSafeZone_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(safeZoneRadius), "SLIDER",
    [LSTRING(SafeZoneRadius_DisplayName), LSTRING(SafeZoneRadius_Description)],
    _category,
    [0, 1000, 100, 0],
    1
] call CBA_fnc_addSetting;
