private _category = [ELSTRING(main,Category_Logistics), "str_state_refuel"];

[
    QGVAR(enabled), "CHECKBOX",
    ELSTRING(common,Enabled),
    _category,
    true,
    1,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(rate), "SLIDER",
    [LSTRING(RefuelSettings_speed_DisplayName), LSTRING(RefuelSettings_speed_Description)],
    _category,
    [0,25,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(cargoRate), "SLIDER",
    [LSTRING(RefuelSettings_speedCargo_DisplayName), LSTRING(RefuelSettings_speedCargo_Description)],
    _category,
    [0,250,10,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(hoseLength), "SLIDER",
    [LSTRING(RefuelSettings_hoseLength_DisplayName)],
    _category,
    [0,50,12,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(progressDuration), "TIME",
    [LSTRING(RefuelSettings_progressDuration_DisplayName), LSTRING(RefuelSettings_progressDuration_Description)],
    _category,
    [0, 10, 2], // [min, max, default value]
    true // isGlobal
] call CBA_fnc_addSetting;
