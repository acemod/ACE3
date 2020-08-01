// Trenches dig/remove durations
[
    QGVAR(smallEnvelopeDigDuration), 
    "TIME", 
    [LSTRING(SmallEnvelopeDigDuration_DisplayName), LSTRING(SmallEnvelopeDigDuration_Description)],
    LSTRING(Category),
    [5, 600, 20], 
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(smallEnvelopeRemoveDuration), 
    "TIME", 
    [LSTRING(SmallEnvelopeRemoveDuration_DisplayName), LSTRING(SmallEnvelopeRemoveDuration_Description)],
    LSTRING(Category),
    [5, 600, 12], 
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(bigEnvelopeDigDuration), 
    "TIME", 
    [LSTRING(BigEnvelopeDigDuration_DisplayName), LSTRING(BigEnvelopeDigDuration_Description)],
    LSTRING(Category),
    [5, 600, 25], 
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(bigEnvelopeRemoveDuration), 
    "TIME", 
    [LSTRING(BigEnvelopeRemoveDuration_DisplayName), LSTRING(BigEnvelopeRemoveDuration_Description)],
    LSTRING(Category),
    [5, 600, 15], 
    true
] call CBA_Settings_fnc_init;
