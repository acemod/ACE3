class ACE_Settings {
    class GVAR(enableServerController) {
        displayName = CSTRING(enableServerController_DisplayName);
        description = CSTRING(enableServerController_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(useACEWeather) {
        displayName = CSTRING(useACEWeather_DisplayName);
        description = CSTRING(useACEWeather_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(syncRain) {
        displayName = CSTRING(syncRain_DisplayName);
        description = CSTRING(syncRain_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(syncWind) {
        displayName = CSTRING(syncWind_DisplayName);
        description = CSTRING(syncWind_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(syncMisc) {
        displayName = CSTRING(syncMisc_DisplayName);
        description = CSTRING(syncMisc_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(serverUpdateInterval) {
        displayName = CSTRING(serverUpdateInterval_DisplayName);
        description = CSTRING(serverUpdateInterval_Description);
        typeName = "SCALAR";
        value = 60;
    };
};
