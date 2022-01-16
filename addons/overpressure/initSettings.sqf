private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(DisplayName)];

[
    QGVAR(distanceCoefficient), "SLIDER",
    [LSTRING(distanceCoefficient_displayName), LSTRING(distanceCoefficient_toolTip)],
    _category,
    [-1, 10, 1, 1],
    1
] call CBA_fnc_addSetting;
