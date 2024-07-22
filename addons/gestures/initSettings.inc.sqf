[
    QGVAR(showOnInteractionMenu), "LIST",
    [LSTRING(ShowOnInteractionMenu_displayName), LSTRING(ShowOnInteractionMenu_description)],
    format ["ACE %1", localize ELSTRING(interact_menu,Category_InteractionMenu)],
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", LSTRING(JustKeybinds), LSTRING(KeysAndInteractionMenu)], 2],
    0
] call CBA_fnc_addSetting;
