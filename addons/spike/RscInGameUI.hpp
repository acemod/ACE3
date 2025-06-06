
// Taken from AGM for optics management.

class RscInGameUI {
    class ACE_RscOptics_spike {
        idd = 141000;
        controls[] = { "reticle", "manualText", QGVAR(mapHelper) };
        onLoad = QUOTE(with uiNamespace do {ACE_RscOptics_spike = _this select 0;};);

        class GVAR(mapHelper): RscMapControl {
            onDraw = QUOTE(_this call FUNC(mapHelperDraw););
            x = 0;
            y = 0;
            w = 0;
            h = 0;
        };

        class manualText: RscText {
            idc = 241000;
            x = "safeZoneX + safeZoneW * 0.425";
            y = "safeZoneY + safeZoneH * 0.2";
            w = "safeZoneW * 0.15";
            h = "safeZoneH * 0.05";
            style = 0 + 2;
            text = CSTRING(Manual);
            colorBackground[] = {0,0,0,0};
            colorText[] = COLOR_WHITE;
            font = "LucidaConsoleB";
            sizeEx = QUOTE(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.2);
            enabled = 1;         
            show = 1;
        };

           class reticle: RscControlsGroupNoScrollbars {
            idc = 242000;
            x = "safeZoneX";
            y = "safeZoneY";
            w = "safeZoneW-safeZoneX";
            h = "safeZoneH-safeZoneY";
            enabled = 1;         
            show = 0;
            class controls {
                class lineV: RscControlsGroupNoScrollbars {
                    idc = 243100;
                    enabled = 1;         
                    show = 1;
                    class Controls {
                        class lineBlack: RscText {
                            x = "safeZoneX + (SafeZoneW * 0.501)";
                            y = "safeZoneY + (SafeZoneH * 0.53)";
                            w = "safeZoneW * 0.0025";
                            h = "safeZoneH * 0.1";
                            colorBackground[] = COLOR_BLACK;
                        };
                        class lineWhite: RscText {
                            x = "safeZoneX + (SafeZoneW * 0.504)";
                            y = "safeZoneY + (SafeZoneH * 0.53)";
                            w = "safeZoneW * 0.0025";
                            h = "safeZoneH * 0.1";
                            colorBackground[] = COLOR_WHITE;
                        };
                        class squareB: RscText {
                            idc = 243101;
                            x = "safeZoneX + safeZoneW * 0.499";
                            y = "safeZoneY + safeZoneH * 0.52";
                            w = "safeZoneH * 0.006";
                            h = "safeZoneW * 0.006";
                            colorBackground[] = COLOR_BLACK;
                        };
                    };
                };
                class lineHL: RscControlsGroupNoScrollbars {
                    idc = 243200;
                    enabled = 1;         
                    show = 1;
                    class Controls {
                        class lineBlack: RscText {
                            x = "safeZoneY + (SafeZoneH * 0.37)";
                            y = "safeZoneX + (SafeZoneW * 0.5)";
                            w = "safeZoneH * 0.1";
                            h = "safeZoneW * 0.003";
                            colorBackground[] = COLOR_BLACK;
                        };
                        class lineWhite: RscText {
                            x = "safeZoneY + (SafeZoneH * 0.37)";
                            y = "safeZoneX + (SafeZoneW * 0.504)";
                            w = "safeZoneH * 0.1";
                            h = "safeZoneW * 0.0023";
                            colorBackground[] = COLOR_WHITE;
                        };
                        class squareL: RscText {
                            idc = 243201;
                            x = "safeZoneX + (SafeZoneW * 0.485)";
                            y = "safeZoneY + safeZoneH * 0.5";
                            w = "safeZoneH * 0.006";
                            h = "safeZoneW * 0.006";
                            colorBackground[] = COLOR_BLACK;
                        };
                    };
                };
                class lineHR: RscControlsGroupNoScrollbars {
                    idc = 243300;
                    enabled = 1;         
                    show = 1;
                    class Controls {
                        class lineBlack: RscText {
                            x = "safeZoneY + (SafeZoneH * 0.53)";
                            y = "safeZoneX + (SafeZoneW * 0.5)";
                            w = "safeZoneH * 0.1";
                            h = "safeZoneW * 0.003";
                            colorBackground[] = COLOR_BLACK;
                        };
                        class lineWhite: RscText {
                            x = "safeZoneY + (SafeZoneH * 0.53)";
                            y = "safeZoneX + (SafeZoneW * 0.504)";
                            w = "safeZoneH * 0.1";
                            h = "safeZoneW * 0.0023";
                            colorBackground[] = COLOR_WHITE;
                        };
                        class squareR: RscText {
                            idc = 243301;
                            x = "safeZoneX + (SafeZoneW * 0.515)";
                            y = "safeZoneY + safeZoneH * 0.5";
                            w = "safeZoneH * 0.006";
                            h = "safeZoneW * 0.006";
                            colorBackground[] = COLOR_BLACK;
                        };
                    };
                };
            };
        }; 
    };
};

