private _category = [ELSTRING(main,Category_Logistics), LSTRING(openMenu)];

[
    QGVAR(enable),
    "CHECKBOX",
    [LSTRING(ModuleSettings_enable), LSTRING(ModuleSettings_enable_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(loadTimeCoefficient),
    "SLIDER",
    [LSTRING(loadTimeCoefficient), LSTRING(loadTimeCoefficient_description)],
    _category,
    [0, 10, 5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(paradropTimeCoefficent),
    "SLIDER",
    [LSTRING(paradropTimeCoefficent), LSTRING(paradropTimeCoefficent_description)],
    _category,
    [0, 10, 2.5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableViv),
    "CHECKBOX",
    [LSTRING(enableViv), LSTRING(enableViv_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(expandedVivObjectSupport),
    "CHECKBOX",
    [LSTRING(expandedVivObjectSupport), LSTRING(expandedVivObjectSupport_description)],
    _category,
    false,
    1,
    {[QGVAR(expandedVivObjectSupport), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(vivMaxLoadDistance),
    "SLIDER",
    [LSTRING(vivMaxLoadDistance), LSTRING(vivMaxLoadDistance_description)],
    _category,
    [1, 50, 20, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vivLoadTime),
    "SLIDER",
    [LSTRING(vivLoadTime), LSTRING(vivLoadTime_description)],
    _category,
    [0, 300, 30, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vivParadropTime),
    "SLIDER",
    [LSTRING(vivParadropTime), LSTRING(vivParadropTime_description)],
    _category,
    [0, 300, 10, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unloadOnKilled),
    "SLIDER",
    [LSTRING(unloadOnKilled), LSTRING(unloadOnKilled_description)],
    _category,
    [0, 1, 0.5, 1, true], // [_min, _max, _default, _trailingDecimals, _isPercentage]
    1
] call CBA_fnc_addSetting;

[
    QGVAR(openAfterUnload),
    "LIST",
    [LSTRING(openAfterUnload), LSTRING(openAfterUnload_description)],
    _category,
    [[0, 1, 2, 3], [ELSTRING(common,never), LSTRING(unloadObject), LSTRING(paradropButton), ELSTRING(common,both)], 0]
] call CBA_fnc_addSetting;

[
    QGVAR(carryAfterUnload),
    "CHECKBOX",
    [LSTRING(carryAfterUnload), LSTRING(carryAfterUnload_description)],
    _category,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableDeploy),
    "CHECKBOX",
    [LSTRING(enableDeploy), LSTRING(enableDeploy_description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableRename),
    "CHECKBOX",
    [LSTRING(ModuleSettings_enableRename), LSTRING(ModuleSettings_enableRename_Description)],
    _category,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(checkSizeInteraction),
    "CHECKBOX",
    LSTRING(checkSizeInteraction),
    _category
] call CBA_fnc_addSetting;
