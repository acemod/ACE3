private _category = [ELSTRING(main,Category_Logistics), LSTRING(openMenu)];

[
    QGVAR(enable),
    "CHECKBOX",
    [LSTRING(ModuleSettings_enable), LSTRING(ModuleSettings_enable_Description)],
    _category,
    true,
    true,
    {[QGVAR(enable), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(loadTimeCoefficient),
    "SLIDER",
    [LSTRING(loadTimeCoefficient), LSTRING(loadTimeCoefficient_description)],
    _category,
    [0, 10, 5, 1],
    true,
    {[QGVAR(loadTimeCoefficient), _this, true] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(paradropTimeCoefficent),
    "SLIDER",
    [LSTRING(paradropTimeCoefficent), LSTRING(paradropTimeCoefficent_description)],
    _category,
    [0, 10, 2.5, 1],
    true,
    {[QGVAR(paradropTimeCoefficent), _this, true] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(openAfterUnload),
    "LIST",
    [LSTRING(openAfterUnload), LSTRING(openAfterUnload_description)],
    _category,
    [[0, 1, 2, 3], [ELSTRING(common,never), LSTRING(unloadObject), LSTRING(paradropButton), ELSTRING(common,both)], 0],
    false,
    {[QGVAR(openAfterUnload), _this, true] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(enableRename),
    "CHECKBOX",
    [LSTRING(ModuleSettings_enableRename), LSTRING(ModuleSettings_enableRename_Description)],
    _category,
    true,
    false,
    {[QGVAR(enableRename), _this, true] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(carryAfterUnload),
    "CHECKBOX",
    [LSTRING(carryAfterUnload), LSTRING(carryAfterUnload_description)],
    _category,
    true,
    false,
    {[QGVAR(carryAfterUnload), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;
