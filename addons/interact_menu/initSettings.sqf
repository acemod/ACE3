private _category = format ["ACE %1", LLSTRING(Category_InteractionMenu)];

[
    QGVAR(selectorColor), "COLOR",
    LSTRING(SelectorColor),
    _category,
    [1, 0, 0],
    false,
    {GVAR(selectorColorHex) = _this call BIS_fnc_colorRGBtoHTML} // Stored in Hex to avoid constant conversion
] call CBA_fnc_addSetting;

[
    QGVAR(colorTextMax), "COLOR",
    LSTRING(ColorTextMax),
    _category,
    [1, 1, 1, 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(colorTextMin), "COLOR",
    LSTRING(ColorTextMin),
    _category,
    [1, 1, 1, 0.25],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(colorShadowMax), "COLOR",
    LSTRING(ColorShadowMax),
    _category,
    [0, 0, 0, 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(colorShadowMin), "COLOR",
    LSTRING(ColorShadowMin),
    _category,
    [0, 0, 0, 0.25],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(textSize), "LIST",
    LSTRING(textSize),
    _category,
    [[0, 1, 2, 3, 4], ["str_very_small", "str_small", "str_medium", "str_large", "str_very_large"], 2],
    0,
    {[QGVAR(textSize), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_fnc_addSetting;

[
    QGVAR(shadowSetting), "LIST",
    [LSTRING(shadowSetting), LSTRING(shadowSettingDescription)],
    _category,
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", "STR_A3_OPTIONS_ENABLED", LSTRING(shadowOutline)], 2],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(actionOnKeyRelease), "CHECKBOX",
    LSTRING(ActionOnKeyRelease),
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(addBuildingActions), "CHECKBOX",
    [LSTRING(addBuildingActions), LSTRING(addBuildingActionsDescription)],
    _category,
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(menuAnimationSpeed), "LIST",
    [LSTRING(menuAnimationSpeed), LSTRING(menuAnimationSpeed_Description)],
    _category,
    [[0, 1, 2], ["str_speed_normal", "2x", "3x"], 0],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(consolidateSingleChild), "CHECKBOX",
    [LSTRING(consolidateSingleChild), LSTRING(consolidateSingleChild_Description)],
    _category,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(alwaysUseCursorInteraction), "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    [_category, LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(cursorKeepCentered), "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [_category, LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(useListMenu), "CHECKBOX",
    LSTRING(UseListMenu),
    [_category, LLSTRING(Category_InteractionMenu)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(menuBackground), "LIST",
    LSTRING(background),
    [_category, LLSTRING(Category_InteractionMenu)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LLSTRING(backgroundBlur), LLSTRING(backgroundBlack)], 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(alwaysUseCursorSelfInteraction), "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    [_category, LELSTRING(Interaction,InteractionMenuSelf)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(cursorKeepCenteredSelfInteraction), "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [_category, LELSTRING(Interaction,InteractionMenuSelf)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(useListMenuSelf), "CHECKBOX",
    LSTRING(UseListMenu),
    [_category, LELSTRING(Interaction,InteractionMenuSelf)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(menuBackgroundSelf), "LIST",
    LSTRING(background),
    [_category, LELSTRING(Interaction,InteractionMenuSelf)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LLSTRING(backgroundBlur), LLSTRING(backgroundBlack)], 0],
    false
] call CBA_fnc_addSetting;
