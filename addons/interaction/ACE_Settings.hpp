
class ACE_Settings {
    class GVAR(enableTeamManagement) {
        displayName = CSTRING(EnableTeamManagement_DisplayName);
        description = CSTRING(EnableTeamManagement_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableMagazinePassing) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(PassMagazineSetting);
        category = ECSTRING(interact_menu,Category_InteractionMenu);
    };
};
