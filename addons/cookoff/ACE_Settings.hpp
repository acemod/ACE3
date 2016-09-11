
class ACE_Settings {
    class GVAR(enable) {
        displayName = CSTRING(enable_name);
        description = CSTRING(enable_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableAmmoCookoff) {
        displayName = CSTRING(enableAmmoCookoff_name);
        description = CSTRING(enableAmmoCookoff_tooltip);
        value = 1;
        typeName = "BOOL";
    };
};
