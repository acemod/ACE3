class ACE_Settings {
    class GVAR(showGoggles) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowGoggles);
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(OnlyFirstPerson), "$STR_A3_OPTIONS_ENABLED"};
    };
};
