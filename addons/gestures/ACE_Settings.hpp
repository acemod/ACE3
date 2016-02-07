class ACE_Settings {
    class GVAR(showOnInteractionMenu) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        category = ECSTRING(interact_menu,Category_InteractionMenu);
        displayName = CSTRING(showOnInteractionMenu_displayName);
        description = CSTRING(showOnInteractionMenu_description);
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(justKeybinds), CSTRING(keysAndInteractionMenu)};
    };
};
