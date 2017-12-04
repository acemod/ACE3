
class ACE_Settings {
    class GVAR(enableTeamManagement) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(EnableTeamManagement_DisplayName);
        description = CSTRING(EnableTeamManagement_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableMagazinePassing) {
        category = CSTRING(DisplayName);
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(PassMagazineSetting);
    };
    class GVAR(disableNegativeRating) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(DisableNegativeRating_DisplayName);
        description = CSTRING(DisableNegativeRating_Description);
        value = 0;
        typeName = "BOOL";
    };
};
