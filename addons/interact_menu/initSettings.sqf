[
    QGVAR(selectorColor),
    "COLOR",
    localize LSTRING(SelectorColor),
    format ["ACE %1", localize LSTRING(Category_InteractionMenu)],
    [1, 0, 0],
    false,
    {GVAR(selectorColorHex) = _this call BIS_fnc_colorRGBtoHTML} // Stored in Hex to avoid constant conversion
] call CBA_settings_fnc_init;

[
    QGVAR(alwaysUseCursorInteraction),
    "CHECKBOX",
    localize LSTRING(AlwaysUseCursorInteraction),
    [format ["ACE %1", localize LSTRING(Category_InteractionMenu)], localize LSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(cursorKeepCentered),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [format ["ACE %1", localize LSTRING(Category_InteractionMenu)], localize LSTRING(Category_InteractionMenu)],
    false,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(menuBackground),
    "LIST",
    localize LSTRING(background),
    [format ["ACE %1", localize LSTRING(Category_InteractionMenu)], localize LSTRING(Category_InteractionMenu)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", localize LSTRING(backgroundBlur), localize LSTRING(backgroundBlack)], 0],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(alwaysUseCursorSelfInteraction),
    "CHECKBOX",
    localize LSTRING(AlwaysUseCursorInteraction),
    [format ["ACE %1", localize LSTRING(Category_InteractionMenu)], localize LSTRING(Category_SelfInteractionMenu)],
    true,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(cursorKeepCenteredSelfInteraction),
    "CHECKBOX",
    [LSTRING(cursorKeepCentered), LSTRING(cursorKeepCenteredDescription)],
    [format ["ACE %1", localize LSTRING(Category_InteractionMenu)], localize LSTRING(Category_SelfInteractionMenu)],
    true,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(menuBackgroundSelf),
    "LIST",
    localize LSTRING(background),
    [format ["ACE %1", localize LSTRING(Category_InteractionMenu)], localize LSTRING(Category_SelfInteractionMenu)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", localize LSTRING(backgroundBlur), localize LSTRING(backgroundBlack)], 0],
    false
] call CBA_settings_fnc_init;
