
class ACE_Settings {
    class GVAR(enable) {
        category = CSTRING(displayName);
        displayName = CSTRING(enable_name);
        description = CSTRING(enable_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableAmmobox) {
        category = CSTRING(displayName);
        displayName = CSTRING(enableBoxCookoff_name);
        description = CSTRING(enableBoxCookoff_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(enableAmmoCookoff) { // For CBA Setting Switch: we can eliminate and just use (ammoCookoffDuration == 0)
        category = CSTRING(displayName);
        displayName = CSTRING(enableAmmoCookoff_name);
        description = CSTRING(enableAmmoCookoff_tooltip);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(ammoCookoffDuration) {
        category = CSTRING(displayName);
        displayName = CSTRING(ammoCookoffDuration_name);
        description = CSTRING(ammoCookoffDuration_tooltip);
        value = 1;
        typeName = "SCALAR";
        sliderSettings[] = {0, 5, 1, 1};
    };
    class GVAR(probabilityCoef) {
        category = CSTRING(displayName);
        displayName = CSTRING(probabilityCoef_name);
        description = CSTRING(probabilityCoef_tooltip);
        value = 1;
        typeName = "SCALAR";
        sliderSettings[] = {0, 5, 1, 1};
    };
};
