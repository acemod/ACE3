class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(vanillaGPS)[] = {{QUOTE(X_gps_default), QUOTE(Y_gps_default), QUOTE(W_gps), QUOTE(H_gps)}, "(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };

        class Variables {
            class GVAR(vanillaGPS) {
                displayName = "GPS MGRS";
                preview = QPATHTOF(UI\mapGps.paa);
                saveToProfile[] = {0,1};
                canResize = 0;
            };
        };
    };
};
