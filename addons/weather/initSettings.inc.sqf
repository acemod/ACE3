private _category = [format ["ACE %1", LLSTRING(Module_DisplayName)]];

[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_DisplayName), LSTRING(enabled_Description)],
    _category,
    true, // default value
    true, // isGlobal
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(updateInterval), "SLIDER",
    [LSTRING(updateInterval_DisplayName), LSTRING(updateInterval_Description)],
    _category,
    [0,300,60,0], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(updateInterval), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(windSimulation), "CHECKBOX",
    [LSTRING(windSimulation_DisplayName), LSTRING(windSimulation_Description)],
    _category,
    true, // default value
    true, // isGlobal
    {[QGVAR(windSimulation), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(showCheckAirTemperature), "CHECKBOX",
    [LSTRING(showCheckAirTemperature_DisplayName), LELSTRING(common,showActionInSelfInteraction)],
    _category,
    true // default value
] call CBA_fnc_addSetting;
