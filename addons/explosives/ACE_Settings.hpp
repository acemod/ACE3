class ACE_Settings {
    class GVAR(RequireSpecialist) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(PunishNonSpecialists) {
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
