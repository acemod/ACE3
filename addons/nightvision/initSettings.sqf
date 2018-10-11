// CBA Settings [ADDON: ace_nightVision]:

[
    QGVAR(effectScaling), "SLIDER",
    [LSTRING(effectScaling_DisplayName), LSTRING(effectScaling_Description)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(effectScaling), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
[
    QGVAR(fogScaling), "SLIDER",
    [LSTRING(fogScaling_DisplayName), LSTRING(fogScaling_Description)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(fogScaling), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(noiseScaling), "SLIDER",
    [LSTRING(noiseScaling_DisplayName), LSTRING(noiseScaling_Description)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(noiseScaling), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(aimDownSightsBlur), "SLIDER",
    [LSTRING(aimDownSightsBlur_DisplayName)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(aimDownSightsBlur), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(disableNVGsWithSights), "CHECKBOX",
    [LSTRING(DisableNVGsWithSights_DisplayName), LSTRING(DisableNVGsWithSights_description)],
    localize LSTRING(Category),
    false, // default value
    true, // isGlobal
    {[QGVAR(disableNVGsWithSights), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(shutterEffects), "CHECKBOX",
    [LSTRING(shutterEffects_DisplayName), LSTRING(shutterEffects_description)],
    localize LSTRING(Category),
    true, // default value
    false, // isGlobal
    {[QGVAR(shutterEffects), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(airFogMultiplier), "SLIDER",
    [LSTRING(airFogMultiplier_DisplayName),LSTRING(airFogMultiplier_Description)],
    localize LSTRING(Category),
    [0,1,0.5,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(airFogMultiplier), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(binoFogMultiplier), "SLIDER",
    [LSTRING(binoFogMultiplier_DisplayName),LSTRING(binoFogMultiplier_Description)],
    localize LSTRING(Category),
    [0,1,0.5,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(binoFogMultiplier), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(carFogMultiplier), "SLIDER",
    [LSTRING(carFogMultiplier_DisplayName),LSTRING(carFogMultiplier_Description)],
    localize LSTRING(Category),
    [0,1,0.5,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(carFogMultiplier), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(staticFogMultiplier), "SLIDER",
    [LSTRING(staticFogMultiplier_DisplayName),LSTRING(staticFogMultiplier_Description)],
    localize LSTRING(Category),
    [0,1,0.5,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(staticFogMultiplier), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(tankFogMultiplier), "SLIDER",
    [LSTRING(tankFogMultiplier_DisplayName),LSTRING(tankFogMultiplier_Description)],
    localize LSTRING(Category),
    [0,1,0.5,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(tankFogMultiplier), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
