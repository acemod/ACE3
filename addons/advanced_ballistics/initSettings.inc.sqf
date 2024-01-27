private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_DisplayName), LSTRING(enabled_Description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(muzzleVelocityVariationEnabled), "CHECKBOX",
    [LSTRING(muzzleVelocityVariationEnabled_DisplayName), LSTRING(muzzleVelocityVariationEnabled_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoTemperatureEnabled), "CHECKBOX",
    [LSTRING(ammoTemperatureEnabled_DisplayName), LSTRING(ammoTemperatureEnabled_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(barrelLengthInfluenceEnabled), "CHECKBOX",
    [LSTRING(barrelLengthInfluenceEnabled_DisplayName), LSTRING(barrelLengthInfluenceEnabled_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bulletTraceEnabled), "CHECKBOX",
    [LSTRING(bulletTraceEnabled_DisplayName), LSTRING(bulletTraceEnabled_Description)],
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
