private _categoryArray = [format ["ACE %1", LLSTRING(DisplayName)]];

[
    QGVAR(defaultAssemblyMode),
    "CHECKBOX",
    [LSTRING(defaultAssemblyMode_displayName), LSTRING(defaultAssemblyMode_description)],
    _categoryArray,
    false, // default value
    1 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(handleExtraMagazines),
    "CHECKBOX",
    [LSTRING(handleExtraMagazines_displayName), LSTRING(handleExtraMagazines_description)],
    _categoryArray,
    true, // default value
    1 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(handleExtraMagazinesType),
    "LIST",
    [LSTRING(handleExtraMagazinesType_displayName), LSTRING(handleExtraMagazinesType_description)],
    _categoryArray,
    [[0, 1], [LSTRING(handleExtraMagazinesType_weaponHolder), LSTRING(handleExtraMagazinesType_ammoBox)], 0],
    1 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(ammoHandling),
    "LIST",
    [LSTRING(ammoHandling_displayName), LSTRING(ammoHandling_description)],
    _categoryArray,
    [[0, 1, 2], [LELSTRING(common,Disabled), LELSTRING(common,playerOnly), LELSTRING(common,playersAndAI)], 2], //  [_values, _valueTitles, _defaultIndex]
    1 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(progressBarTimeCoefficent),
    "SLIDER",
    [LSTRING(progressBarTimeCoefficent_displayName), LSTRING(progressBarTimeCoefficent_description)],
    _categoryArray,
    [0, 2, 1, 2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    1 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(dragAfterDeploy),
    "CHECKBOX",
    [LSTRING(dragAfterDeploy_displayName), LSTRING(dragAfterDeploy_description)],
    _categoryArray
] call CBA_fnc_addSetting;
