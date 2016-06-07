class ACE_Settings {
    class GVAR(rotateModifierKey) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(rotateModifierKey_displayName);
        description = CSTRING(rotateModifierKey_description);
        values[] = {"$STR_A3_OPTIONS_DISABLED", "ALT", "CTRL", "SHIFT"};
    };
};
