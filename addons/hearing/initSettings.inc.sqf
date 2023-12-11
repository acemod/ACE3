private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
    QGVAR(enableCombatDeafness), "CHECKBOX",
    [LSTRING(EnableCombatDeafness_DisplayName), LSTRING(EnableCombatDeafness_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(earplugsVolume), "SLIDER",
    [LSTRING(earplugsVolume_DisplayName), LSTRING(earplugsVolume_Description)],
    _category,
    [0, 1, 0.5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unconsciousnessVolume), "SLIDER",
    [LSTRING(unconsciousnessVolume_DisplayName), LSTRING(unconsciousnessVolume_Description)],
    _category,
    [0, 1, 0.4, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(disableEarRinging), "CHECKBOX",
    [LSTRING(DisableEarRinging_DisplayName), LSTRING(DisableEarRinging_Description)],
    _category,
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(enabledForZeusUnits), "CHECKBOX",
    [LSTRING(enabledForZeusUnits_DisplayName), LSTRING(enabledForZeusUnits_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(autoAddEarplugsToUnits), "CHECKBOX",
    [LSTRING(autoAddEarplugsToUnits_DisplayName), LSTRING(autoAddEarplugsToUnits_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;
