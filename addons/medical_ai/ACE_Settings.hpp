class ACE_Settings {
    class GVAR(enabledFor) {
        category = ECSTRING(medical,Category_Medical);
        value = 2;
        typeName = "SCALAR";
        values[] = {ECSTRING(Common,Disabled), CSTRING(enabledFor_OnlyServerAndHC), ECSTRING(Common,Enabled)};
    };
};
