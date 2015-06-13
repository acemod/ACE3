class ACE_Settings {
    class GVAR(optionMenuDisplaySize) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(uiScaing);
        values[] = {"$str_medium", "$str_large", "$str_very_large"};
    };
    class GVAR(showNewsOnMainMenu) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(showNewsOnMainMenu_name);
    };
};
