class ACE_Settings {
    class GVAR(enable) {
        category = CSTRING(Settings_Food);
        displayName = CSTRING(Settings_Enable_DisplayName);
        description = CSTRING(Settings_Enable_Description);
        value = 1;
        typeName = "BOOL";
        isClientSettable = 0;
    };

    class GVAR(enableHUD) {
        category = CSTRING(Settings_Food);
        displayName = CSTRING(Settings_EnableHUD_DisplayName);
        description = CSTRING(Settings_EnableHUD_Description);
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
    };
    
    class GVAR(food_decent_rate) {
        category = CSTRING(Settings_Food);
        displayName = CSTRING(Settings_FoodDecentRate_DisplayName);
        description = CSTRING(Settings_FoodDecentRate_Description);
        typeName = "SCALAR";
        value = 0.02;
        sliderSettings[] = {0.01, 0.1, 0.02, 3};
        isClientSettable = 0;
    };

    class GVAR(water_decent_rate) {
        category = CSTRING(Settings_Food);
        displayName = CSTRING(Settings_WaterDecentRate_DisplayName);
        description = CSTRING(Settings_WaterDecentRate_Description);
        typeName = "SCALAR";
        value = 0.025;
        sliderSettings[] = {0.01, 0.1, 0.025, 3};
        isClientSettable = 0;
    };
};