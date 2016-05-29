
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(enableServerController): CBA_Setting_Boolean_base {
            displayName = CSTRING(enableServerController_DisplayName);
            tooltip = CSTRING(enableServerController_Description);
            defaultValue = 1;
        };
        class GVAR(useACEWeather): CBA_Setting_Boolean_base {
            displayName = CSTRING(useACEWeather_DisplayName);
            tooltip = CSTRING(useACEWeather_Description);
            defaultValue = 1;
        };
        class GVAR(syncRain): CBA_Setting_Boolean_base {
            displayName = CSTRING(syncRain_DisplayName);
            tooltip = CSTRING(syncRain_Description);
            defaultValue = 1;
        };
        class GVAR(syncWind): CBA_Setting_Boolean_base {
            displayName = CSTRING(syncWind_DisplayName);
            tooltip = CSTRING(syncWind_Description);
            defaultValue = 1;
        };
        class GVAR(syncMisc): CBA_Setting_Boolean_base {
            displayName = CSTRING(syncMisc_DisplayName);
            tooltip = CSTRING(syncMisc_Description);
            defaultValue = 1;
        };
        class GVAR(serverUpdateInterval): CBA_Setting_Slider_base {
            displayName = CSTRING(serverUpdateInterval_DisplayName);
            tooltip = CSTRING(serverUpdateInterval_Description);
            min = 0;
            max = 600;
            defaultValue = 60;
        };
    };
};
