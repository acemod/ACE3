
class CBA_Setting_List_base;

class CBA_Settings {
    class DOUBLES(PREFIX,interact_menu) {
        //displayName = ECSTRING(interact_menu,Category_InteractionMenu);

        class GVAR(showOnInteractionMenu): CBA_Setting_List_base {
            displayName = CSTRING(ShowOnInteractionMenu_displayName);
            tooltip = CSTRING(ShowOnInteractionMenu_description);
            values[] = {0,1,2};
            labels[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(JustKeybinds), CSTRING(KeysAndInteractionMenu)};
            defaultValue = 2;
        };
    };
};
