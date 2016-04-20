class ACE_Settings {
    class GVAR(enabledFor) {
        displayName = CSTRING(enabledFor_displayName);
        typeName = "SCALAR";
        value = 1;
        values[] = {ECSTRING(Common,Disabled), CSTRING(enabledFor_onlyAircraft), ECSTRING(Common,Enabled)};
    };
};
