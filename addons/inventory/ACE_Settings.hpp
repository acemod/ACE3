class ACE_Settings {
    class GVAR(inventoryDisplaySize) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(SettingName);
        description = CSTRING(SettingDescription);
        values[] = {"$str_medium", "$str_large", "$str_very_large"};
    };
};