class ACE_Settings {
    class GVAR(allowHandcuffOwnSide) {
        displayName = CSTRING(ModuleSettings_handcuffSide_name);
        description = CSTRING(ModuleSettings_handcuffSide_description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(requireSurrender) {
        displayName = CSTRING(ModuleSettings_requireSurrender_name);
        description = CSTRING(ModuleSettings_requireSurrender_description);
        typeName = "SCALAR";
        values[] = {ECSTRING(common,Disabled), CSTRING(SurrenderOnly), CSTRING(SurrenderOrNoWeapon)};
        value = 1;
    };
    class GVAR(allowSurrender) {
        displayName = CSTRING(ModuleSettings_allowSurrender_name);
        description = CSTRING(ModuleSettings_allowSurrender_description);
        typeName = "BOOL";
        value = 1;
    };
};
