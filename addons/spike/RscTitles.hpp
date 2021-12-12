class RscOpticsValue;
class RscControlsGroupNoScrollbars;
class RscPicture;
class RscLine;
class RscMapControl;
class RscText;

#define COLOR_WHITE {0.8745,0.8745,0.8745,1}
#define COLOR_BLACK {0,0,0,1}

class RscTitles {
    class ACE_guidance_spike {
        idd = 1299230000;
        controls[] = { "reticle", "manualText" };
        duration = 100000;
        fadein = 0;
        fadeout = 0;
        name = "spike_reticle";
        onLoad = QUOTE(with uiNamespace do {ACE_guidance_camera_reticle = _this select 0;};);

        class manualText: RscText {
            idc = 241000;
            x = "safeZoneX + safeZoneW * 0.425";
            y = "safeZoneY + safeZoneH * 0.2";
            w = "safeZoneW * 0.15";
            h = "safeZoneH * 0.05";
            style = "0 + 2";
            text = "MANUAL";
            colorBackground[] = {0,0,0,0};
            colorText[] = COLOR_WHITE;
            font = "LucidaConsoleB";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.2);
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
            show = 1;
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

