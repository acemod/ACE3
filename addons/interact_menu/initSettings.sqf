[
    QGVAR(selectorColor),
    "COLOR",
    LSTRING(SelectorColor),
    format ["ACE %1", LLSTRING(Category_InteractionMenu)],
    [1, 0, 0],
    false,
    {GVAR(selectorColorHex) = _this call BIS_fnc_colorRGBtoHTML} // Stored in Hex to avoid constant conversion
] call CBA_settings_fnc_init;

[
    QGVAR(alwaysUseCursorInteraction),
    "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(cursorKeepCentered),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(useListMenu),
    "CHECKBOX",
    LSTRING(UseListMenu),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(menuBackground),
    "LIST",
    LSTRING(background),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LLSTRING(Category_InteractionMenu)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LLSTRING(backgroundBlur), LLSTRING(backgroundBlack)], 0],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(alwaysUseCursorSelfInteraction),
    "CHECKBOX",
    LSTRING(AlwaysUseCursorInteraction),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    true,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(cursorKeepCenteredSelfInteraction),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(useListMenuSelf),
    "CHECKBOX",
    LSTRING(UseListMenu),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(menuBackgroundSelf),
    "LIST",
    LSTRING(background),
    [format ["ACE %1", LLSTRING(Category_InteractionMenu)], LELSTRING(Interaction,InteractionMenuSelf)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LLSTRING(backgroundBlur), LLSTRING(backgroundBlack)], 0],
    false
] call CBA_settings_fnc_init;
