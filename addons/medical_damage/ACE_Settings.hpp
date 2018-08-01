class ACE_Settings {
    class EGVAR(medical,playerDamageThreshold) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(playerDamageThreshold_DisplayName);
        description = CSTRING(playerDamageThreshold_Description);
        typeName = "SCALAR";
        value = 1.0;
        sliderSettings[] = {0, 25, 1, 2};
    };
    class EGVAR(medical,AIDamageThreshold) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AIDamageThreshold_DisplayName);
        description = CSTRING(AIDamageThreshold_Description);
        typeName = "SCALAR";
        value = 1.0;
        sliderSettings[] = {0, 25, 1, 2};
    };
};
