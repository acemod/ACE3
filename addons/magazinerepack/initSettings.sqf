private _category = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(timePerAmmo),
    "SLIDER",
    LSTRING(timePerAmmo),
    _category,
    [1, 10, 1.5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(timePerMagazine),
    "SLIDER",
    LSTRING(timePerMagazine),
    _category,
    [1, 10, 2, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(timePerBeltLink),
    "SLIDER",
    LSTRING(timePerBeltLink),
    _category,
    [1, 10, 8, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(repackEquippedMagazines), "LIST",
    LSTRING(repackEquippedMagazines),
    _category,
    [[0, 1, 2], [ELSTRING(common,No), ELSTRING(common,Yes), LSTRING(repackEquippedMagazinesShowHint)], 2],
    0
] call CBA_fnc_addSetting;
