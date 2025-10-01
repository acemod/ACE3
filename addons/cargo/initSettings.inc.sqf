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
