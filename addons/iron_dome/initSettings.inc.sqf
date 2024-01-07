[
    QGVAR(enable), "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(enable_description)],
    LSTRING(category),
    false, // default value
    true, // isGlobal
    {[QGVAR(enable), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(targetRecycleTime), "SLIDER",
    [LSTRING(targetRecycleTime_setting), LSTRING(targetRecycleTime_description)],
    LSTRING(category),
    [0, 60, 15, 0, false], // default value
    true, // isGlobal
    {[QGVAR(targetRecycleTime), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(launchAcceptableAngle), "SLIDER",
    [LSTRING(launchAcceptableAngle_setting), LSTRING(launchAcceptableAngle_description)],
    LSTRING(category),
    [1, 60, 10, 0, false], // default value
    true, // isGlobal
    {[QGVAR(launchAcceptableAngle), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(launchAcceptableElevation), "SLIDER",
    [LSTRING(launchAcceptableElevation_setting), LSTRING(launchAcceptableElevation_description)],
    LSTRING(category),
    [-90, 90, 5, 0, false], // default value
    true, // isGlobal
    {[QGVAR(launchAcceptableElevation), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(timeBetweenLaunches), "SLIDER",
    [LSTRING(timeBetweenLaunches_setting), LSTRING(timeBetweenLaunches_description)],
    LSTRING(category),
    [0, 60, 1, 0, false], // default value
    true, // isGlobal
    {[QGVAR(timeBetweenLaunches), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(proximityFuseRange), "SLIDER",
    [LSTRING(proximityFuseRange_setting), LSTRING(proximityFuseRange_description)],
    LSTRING(category),
    [1, 50, 10, 0, false], // default value
    true, // isGlobal
    {[QGVAR(timeBetweenLaunches), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(proximityFuseFailureChance), "SLIDER",
    [LSTRING(proximityFuseFailureChance_setting), LSTRING(proximityFuseFailureChance_description)],
    LSTRING(category),
    [0, 1, 0, 2, true], // default value
    true, // isGlobal
    {[QGVAR(proximityFuseFailureChance), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

