private _category = format ["ACE %1", localize LSTRING(windDeflection_DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(deflectionModule_DisplayName), LSTRING(deflectionModule_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleEnabled), "CHECKBOX",
    [LSTRING(vehicleEnabled_DisplayName), LSTRING(vehicleEnabled_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(simulationInterval), "SLIDER",
    [LSTRING(simulationInterval_DisplayName), LSTRING(simulationInterval_Description)],
    _category,
    [0, 0.2, 0.05, 2],
    1
] call CBA_fnc_addSetting;
