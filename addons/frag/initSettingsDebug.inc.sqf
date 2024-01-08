private _category = format ["ACE %1", localize LSTRING(Module_DisplayName)];

[
	QGVAR(debugOptions), 
	"CHECKBOX", 
	"Enable debug mode", 
	[_category, LSTRING(Debug)], 
	true // [min, max, default, trailing decimals]
] call CBA_fnc_addSetting;

// debug options
[
	QGVAR(dbgSphere), 
	"CHECKBOX", 
	"Enable debug impact spheres", 
	[_category, LSTRING(Debug)], 
	false, 
	0,
	{},
	true
] call CBA_fnc_addSetting;

[
	QGVAR(frameHint), 
	"CHECKBOX", 
	"Show framerate hint", 
	[_category, LSTRING(Debug)], 
	true 
] call CBA_fnc_addSetting;

[
	QGVAR(fadeRounds), 
	"CHECKBOX", 
	"Fade round traces over time", 
	[_category, LSTRING(Debug)], 
	true 
] call CBA_fnc_addSetting;

[
	QGVAR(dltTrace), 
	"CHECKBOX", 
	"Delete fire trace on fade", 
	[_category, LSTRING(Debug)], 
	true
] call CBA_fnc_addSetting;

[
	QGVAR(drawHitBox), 
	"CHECKBOX", 
	"Draw unit hitboxes", 
	[_category, LSTRING(Debug)], 
	true
] call CBA_fnc_addSetting;

