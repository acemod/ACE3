class ACE_Settings {
    class GVAR(RequireSpecialist) {
        displayName = CSTRING(RequireSpecialist_DisplayName);
        description = CSTRING(RequireSpecialist_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(PunishNonSpecialists) {
        displayName = CSTRING(PunishNonSpecialists_DisplayName);
        description = CSTRING(PunishNonSpecialists_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(ExplodeOnDefuse) {
        displayName = CSTRING(ExplodeOnDefuse_DisplayName);
        description = CSTRING(ExplodeOnDefuse_Description);
        value = 1;
        typeName = "BOOL";
    };
};
