private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(timePerAmmo), "SLIDER",
    LSTRING(timePerAmmo),
    _category,
    [1, 10, 1.5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(timePerMagazine), "SLIDER",
    LSTRING(timePerMagazine),
    _category,
    [1, 10, 2, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(timePerBeltLink), "SLIDER",
    LSTRING(timePerBeltLink),
    _category,
    [1, 10, 8, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(repackLoadedMagazines), "CHECKBOX",
    LSTRING(repackLoadedMagazines),
    _category,
    true,
    0
] call CBA_fnc_addSetting;
