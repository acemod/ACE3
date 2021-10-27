private _category = [LELSTRING(common,categoryUncategorized), QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(distanceCoefficient), "SLIDER",
    [LSTRING(distanceCoefficient_displayName), LSTRING(distanceCoefficient_toolTip)],
    _category,
    [-1, 10, 5, 1],
    1
] call CBA_fnc_addSetting;
