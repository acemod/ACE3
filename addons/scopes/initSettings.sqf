private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_displayName), LSTRING(enabled_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(forceUseOfAdjustmentTurrets), "CHECKBOX",
    [LSTRING(forceUseOfAdjustmentTurrets_displayName), LSTRING(forceUseOfAdjustmentTurrets_description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(correctZeroing), "CHECKBOX",
    [LSTRING(correctZeroing_displayName), LSTRING(correctZeroing_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(overwriteZeroRange), "CHECKBOX",
    [LSTRING(overwriteZeroRange_displayName), LSTRING(overwriteZeroRange_description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(defaultZeroRange), "SLIDER",
    [LSTRING(defaultZeroRange_displayName), LSTRING(defaultZeroRange_description)],
    _category,
    [0, 1000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(zeroReferenceTemperature), "SLIDER",
    [LSTRING(zeroReferenceTemperature_displayName), LSTRING(zeroReferenceTemperature_description)],
    _category,
    [-55, 55, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(zeroReferenceBarometricPressure), "SLIDER",
    [LSTRING(zeroReferenceBarometricPressure_displayName), LSTRING(zeroReferenceBarometricPressure_description)],
    _category,
    [0, 1013.25, 1013.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(zeroReferenceHumidity), "SLIDER",
    [LSTRING(zeroReferenceHumidity_displayName), LSTRING(zeroReferenceHumidity_description)],
    _category,
    [0, 1, 0, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(useLegacyUI), "CHECKBOX",
    [LSTRING(useLegacyUI_displayName), LSTRING(useLegacyUI_description)],
    _category,
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(simplifedZeroing), "CHECKBOX",
    [LSTRING(simplifiedZeroing_displayName), LSTRING(simplifiedZeroing_description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
