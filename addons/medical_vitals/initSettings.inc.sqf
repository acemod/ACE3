[
    QGVAR(simulateSpO2),
    "CHECKBOX",
    [LSTRING(simulateSpO2_DisplayName), LSTRING(simulateSpO2_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    1,
    {
        if (_this) exitWith {}; // skip if true
        {
            _x setVariable [VAR_OXYGEN_DEMAND, 0, true];
            _x setVariable [VAR_SPO2, DEFAULT_SPO2, true];
        } forEach (allUnits select {local _x})
    } // reset oxygen demand on setting change
] call CBA_fnc_addSetting;
