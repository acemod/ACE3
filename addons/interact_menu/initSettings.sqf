[
    QGVAR(selectorColor),
    "COLOR",
    LSTRING(SelectorColor),
    format ["ACE %1", LLSTRING(Category_InteractionMenu)],
    [1, 0, 0],
    false,
    {GVAR(selectorColorHex) = _this call BIS_fnc_colorRGBtoHTML} // Stored in Hex to avoid constant conversion
] call CBA_fnc_addSetting;

[
    QGVAR(consolidateSingleChild),
    "CHECKBOX",
    [LSTRING(consolidateSingleChild), LSTRING(consolidateSingleChild_Description)],
    format ["ACE %1", LLSTRING(Category_InteractionMenu)],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(alwaysUseCursorInteraction),
    "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(cursorKeepCentered),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(useListMenu),
    "CHECKBOX",
    LSTRING(UseListMenu),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(menuBackground),
    "LIST",
    LSTRING(background),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LLSTRING(backgroundBlur), LLSTRING(backgroundBlack)], 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(alwaysUseCursorSelfInteraction),
    "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(cursorKeepCenteredSelfInteraction),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(useListMenuSelf),
    "CHECKBOX",
    LSTRING(UseListMenu),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    false,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(menuBackgroundSelf),
    "LIST",
    LSTRING(background),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LLSTRING(backgroundBlur), LLSTRING(backgroundBlack)], 0],
    false
] call CBA_fnc_addSetting;
