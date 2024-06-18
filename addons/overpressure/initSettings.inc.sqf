private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(DisplayName)];

[
    QGVAR(backblastDistanceCoefficient),
    "SLIDER",
    [LSTRING(statBackblastRange), LSTRING(backblastDistanceCoefficient_toolTip)],
    _category,
    [0, 10, 1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(overpressureDistanceCoefficient), 
    "SLIDER",
    [LSTRING(statOverpressureRange), LSTRING(overpressureDistanceCoefficient_toolTip)],
    _category,
    [0, 10, 1, 1],
    1
] call CBA_fnc_addSetting;
