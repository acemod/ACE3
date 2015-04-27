class ACE_Settings {
    class GVAR(enableServerController) {
        displayName = "Weather propagation";
        description = "Enables sever side weather propagation";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(useACEWeather) {
        displayName = "ACE Weather";
        description = "Overrides the default weather (editor, mission settings) with ACE weather (map based)";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(syncRain) {
        displayName = "Sync Rain";
        description = "Synchronizes rain";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(syncWind) {
        displayName = "Sync Wind";
        description = "Synchronizes wind";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(syncMisc) {
        displayName = "Sync Misc";
        description = "Synchronizes lightnings, rainbow, fog, ...";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(serverUpdateInterval) {
        displayName = "Update Interval";
        description = "Defines the interval (seconds) between weather updates";
        typeName = "SCALAR";
        value = 60;
    };
};
