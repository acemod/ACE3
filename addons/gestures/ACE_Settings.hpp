class ACE_Settings {
    class GVAR(showOnInteractionMenu) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        category = ECSTRING(interact_menu,Category_InteractionMenu);
        displayName = CSTRING(ShowOnInteractionMenu_displayName);
        description = CSTRING(ShowOnInteractionMenu_description);
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(JustKeybinds), CSTRING(KeysAndInteractionMenu)};
    };
};
