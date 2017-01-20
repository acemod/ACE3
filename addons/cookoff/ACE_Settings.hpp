
class ACE_Settings {
    class GVAR(enable) {
        displayName = CSTRING(enable_name);
        description = CSTRING(enable_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableAmmobox) {
        displayName = CSTRING(enableBoxCookoff_name);
        description = CSTRING(enableBoxCookoff_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableAmmoCookoff) { // For CBA Setting Switch: we can eliminate and just use (ammoCookoffDuration == 0)
        displayName = CSTRING(enableAmmoCookoff_name);
        description = CSTRING(enableAmmoCookoff_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(ammoCookoffDuration) {
        displayName = CSTRING(ammoCookoffDuration_name);
        description = CSTRING(ammoCookoffDuration_tooltip);
        value = 1;
        typeName = "SCALAR";
    };
};
