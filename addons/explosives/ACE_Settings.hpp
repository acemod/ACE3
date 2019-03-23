class ACE_Settings {
    class GVAR(requireSpecialist) {
        category = CSTRING(Menu);
        displayName = CSTRING(RequireSpecialist_DisplayName);
        description = CSTRING(RequireSpecialist_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(punishNonSpecialists) {
        category = CSTRING(Menu);
        displayName = CSTRING(PunishNonSpecialists_DisplayName);
        description = CSTRING(PunishNonSpecialists_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(explodeOnDefuse) {
        category = CSTRING(Menu);
        displayName = CSTRING(ExplodeOnDefuse_DisplayName);
        description = CSTRING(ExplodeOnDefuse_Description);
        value = 1;
        typeName = "BOOL";
    };
};
