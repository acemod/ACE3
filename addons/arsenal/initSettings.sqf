// Arsenal
private _category = localize LSTRING(settingCategory);
[
    QGVAR(camInverted),
    "CHECKBOX",
    localize LSTRING(invertCameraSetting),
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
    QGVAR(toolsTab),
    "CHECKBOX",
    [LSTRING(toolsTab_displayName), LSTRING(toolsTab_description)],
    _category,
    true,
    false, // isGlobal
    {[QGVAR(toolsTab), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableIdentityTabs),
    "CHECKBOX",
    localize LSTRING(enableIdentityTabsSettings),
    _category,
    true,
    true
] call CBA_fnc_addSetting;

private _loadoutCategory = localize LSTRING(loadoutSubcategory);

// Arsenal loadouts
[QGVAR(allowDefaultLoadouts),
    "CHECKBOX",
    [LSTRING(allowDefaultLoadoutsSetting), LSTRING(defaultLoadoutsTooltip)],
    [_category, _loadoutCategory],
    true,
    true
] call CBA_fnc_addSetting;

[QGVAR(allowSharedLoadouts),
    "CHECKBOX",
    localize LSTRING(allowSharingSetting),
    [_category, _loadoutCategory],
    true,
    true
] call CBA_fnc_addSetting;

[QGVAR(EnableRPTLog),
    "CHECKBOX",
    [LSTRING(printToRPTSetting),
    LSTRING(printToRPTTooltip)],
    [_category, _loadoutCategory],
    false,
    false
] call CBA_fnc_addSetting;

[QGVAR(loadoutsSaveFace),
    "CHECKBOX",
    localize LSTRING(loadoutsSaveFaceSetting),
    [_category, _loadoutCategory],
    false
] call CBA_fnc_addSetting;

[QGVAR(loadoutsSaveVoice),
    "CHECKBOX",
    localize LSTRING(loadoutsSaveVoiceSetting),
    [_category, _loadoutCategory],
    false
] call CBA_fnc_addSetting;

[QGVAR(loadoutsSaveInsignia),
    "CHECKBOX",
    localize LSTRING(loadoutsSaveInsigniaSetting),
    [_category, _loadoutCategory],
    true
] call CBA_fnc_addSetting;
