[
    QGVAR(simulateSpO2),
    "CHECKBOX",
    [LSTRING(simulateSpO2_DisplayName), LSTRING(simulateSpO2_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    true
] call CBA_fnc_addSetting;
