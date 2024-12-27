private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(DisplayName)];

[
    QGVAR(overpressureDistanceCoefficient),
    "SLIDER",
    [LSTRING(distanceCoefficient_displayName), LSTRING(distanceCoefficient_toolTip)],
    _category,
    [0, 10, 1, 1],
    1,
    {[QGVAR(overpressureDistanceCoefficient), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(backblastDistanceCoefficient),
    "SLIDER",
    [LSTRING(backblastDistanceCoefficient_displayName), LSTRING(backblastDistanceCoefficient_toolTip)],
    _category,
    [0, 10, 1, 1],
    1,
    {[QGVAR(backblastDistanceCoefficient), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
