private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_displayName), LSTRING(enabled_description)],
    _category,
    true,
    1,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(heatCoef), "SLIDER",
    [LSTRING(heatCoef_displayName), LSTRING(heatCoef_description)],
    _category,
    [0, 5, 1, 2],
    1,
    {
        if (!GVAR(enabled)) exitWith {};
        TRACE_2("resetting cache",GVAR(heatCoef),count GVAR(cacheAmmoData));
        GVAR(cacheAmmoData) = createHashMap;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(coolingCoef), "SLIDER",
    [LSTRING(coolingCoef_displayName), LSTRING(coolingCoef_description)],
    _category,
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(suppressorCoef), "SLIDER",
    [LSTRING(suppressorCoef_displayName), LSTRING(suppressorCoef_description)],
    _category,
    [0, 5, 1, 2],
    1,
    {
        if (!GVAR(enabled)) exitWith {};
        TRACE_2("resetting cache",GVAR(suppressorCoef),count GVAR(cacheSilencerData));
        GVAR(cacheSilencerData) = createHashMap;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(showParticleEffects), "CHECKBOX",
    [LSTRING(showParticleEffects_displayName), LSTRING(showParticleEffects_description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showParticleEffectsForEveryone), "CHECKBOX",
    [LSTRING(showParticleEffectsForEveryone_displayName), LSTRING(showParticleEffectsForEveryone_description)],
    _category,
    false,
    0,
    {[QGVAR(showParticleEffectsForEveryone), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(overheatingDispersion), "CHECKBOX",
    [LSTRING(overheatingDispersion_displayName), LSTRING(overheatingDispersion_description)],
    _category,
    true,
    1,
    {[QGVAR(overheatingDispersion), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(particleEffectsAndDispersionDistance), "SLIDER",
    [LSTRING(particleEffectsAndDispersionDistance_displayName), LSTRING(particleEffectsAndDispersionDistance_description)],
    _category,
    [1, 5000, 3000, 0],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(overheatingRateOfFire), "CHECKBOX",
    [LSTRING(overheatingRateOfFire_displayName), LSTRING(overheatingRateOfFire_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(displayTextOnJam), "CHECKBOX",
    [LSTRING(DisplayTextOnJam_displayName), LSTRING(displayTextOnJam_description)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(jamChanceCoef), "SLIDER",
    [LSTRING(jamChanceCoef_displayName), LSTRING(jamChanceCoef_description)],
    _category,
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unJamOnreload), "CHECKBOX",
    [LSTRING(unJamOnreload_displayName), LSTRING(unJamOnreload_description)],
    _category,
    false,
    1,
    {[QGVAR(unJamOnreload), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(unJamOnSwapBarrel), "CHECKBOX",
    [LSTRING(unJamOnSwapBarrel_displayName), LSTRING(unJamOnSwapBarrel_description)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unJamFailChance), "SLIDER",
    [LSTRING(unJamFailChance_displayName), LSTRING(unJamFailChance_description)],
    _category,
    [0, 1, 0.1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cookoffCoef), "SLIDER",
    [LSTRING(cookoffCoef_displayName), LSTRING(cookoffCoef_description)],
    _category,
    [0, 5, 1, 2],
    1,
    {[QGVAR(cookoffCoef), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
