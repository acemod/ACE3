[
    QGVAR(dragAndFire),
    "CHECKBOX",
    [LSTRING(DragAndFire_DisplayName), LSTRING(DragAndFire_Description)],
    localize LSTRING(SettingsName),
    true,
    false
] call CBA_fnc_addSetting;

[
    "ACE_maxWeightDrag",
    "SLIDER",
    [LSTRING(maxWeightDrag_DisplayName), LSTRING(maxWeightDrag_Description)],
    localize LSTRING(SettingsName),
    [-1, 2000, 800, -1],
    1
] call CBA_fnc_addSetting;

[
    "ACE_maxWeightCarry",
    "SLIDER",
    [LSTRING(maxWeightCarry_DisplayName), LSTRING(maxWeightCarry_Description)],
    localize LSTRING(SettingsName),
    [-1, 2000, 600, -1],
    1
] call CBA_fnc_addSetting;
