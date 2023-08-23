// Arsenal
private _category = LLSTRING(settingCategory);
[
    QGVAR(camInverted),
    "CHECKBOX",
    LLSTRING(invertCameraSetting),
    _category,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableModIcons),
    "CHECKBOX",
    [LSTRING(modIconsSetting), LSTRING(modIconsTooltip)],
    _category,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fontHeight),
    "SLIDER",
    [LSTRING(fontHeightSetting), LSTRING(fontHeightTooltip)],
    _category,
    [1, 10, 4.5, 1]
] call CBA_fnc_addSetting;

[
    QGVAR(enableIdentityTabs),
    "CHECKBOX",
    LLSTRING(enableIdentityTabsSettings),
    _category,
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(defaultToFavorites),
    "CHECKBOX",
    [LSTRING(defaultToFavoritesSetting), LSTRING(defaultToFavoritesTooltip)],
    _category,
    false,
    2 // never overwrite the client
] call CBA_fnc_addSetting;

[
    QGVAR(favoritesColor),
    "COLOR",
    [LSTRING(favoritesColorSetting), LSTRING(favoritesColorTooltip)],
    _category,
    [0.9, 0.875, 0.6],
    2 // never overwrite the client
] call CBA_fnc_addSetting;

private _loadoutCategory = LLSTRING(loadoutSubcategory);

// Arsenal loadouts
[
    QGVAR(allowDefaultLoadouts),
    "CHECKBOX",
    [LSTRING(allowDefaultLoadoutsSetting), LSTRING(defaultLoadoutsTooltip)],
    [_category, _loadoutCategory],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSharedLoadouts),
    "CHECKBOX",
    LLSTRING(allowSharingSetting),
    [_category, _loadoutCategory],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(EnableRPTLog),
    "CHECKBOX",
    [LSTRING(printToRPTSetting),
    LSTRING(printToRPTTooltip)],
    [_category, _loadoutCategory],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(loadoutsSaveFace),
    "CHECKBOX",
    LLSTRING(loadoutsSaveFaceSetting),
    [_category, _loadoutCategory],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(loadoutsSaveVoice),
    "CHECKBOX",
    LLSTRING(loadoutsSaveVoiceSetting),
    [_category, _loadoutCategory],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(loadoutsSaveInsignia),
    "CHECKBOX",
    LLSTRING(loadoutsSaveInsigniaSetting),
    [_category, _loadoutCategory],
    true
] call CBA_fnc_addSetting;
