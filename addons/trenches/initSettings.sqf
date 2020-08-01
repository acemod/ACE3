// Trenches dig/remove durations
[
	QGVAR(smallEnvelopeDigDuration), 
	"SLIDER", 
    [LSTRING(SmallEnvelopeDigDuration_DisplayName), LSTRING(SmallEnvelopeDigDuration_Description)],
    LSTRING(Category),
	[5, 600, 20, 0], 
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(smallEnvelopeRemoveDuration), 
	"SLIDER", 
    [LSTRING(SmallEnvelopeRemoveDuration_DisplayName), LSTRING(SmallEnvelopeRemoveDuration_Description)],
    LSTRING(Category),
	[5, 600, 12, 0], 
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(bigEnvelopeDigDuration), 
	"SLIDER", 
    [LSTRING(BigEnvelopeDigDuration_DisplayName), LSTRING(BigEnvelopeDigDuration_Description)],
    LSTRING(Category),
	[5, 600, 25, 0], 
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(bigEnvelopeRemoveDuration), 
	"SLIDER", 
    [LSTRING(BigEnvelopeRemoveDuration_DisplayName), LSTRING(BigEnvelopeRemoveDuration_Description)],
    LSTRING(Category),
	[5, 600, 15, 0], 
	true
] call CBA_Settings_fnc_init;
