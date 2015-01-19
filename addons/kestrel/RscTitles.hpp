
class RscPicture;
class RscText;

class RscTitles {
    class ACE_Kestrel {
        onload = QUOTE(_this call FUNC(onLoadKestrel));
        //onunload = "";
        idd = -1;
        movingEnable = 0;
        enableDisplay = 1;
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        enablesimulation = 1;

        class controls {
            class Kestrel1: RscPicture {
                idc = 10;
                text = PATHTOF(data\4500NV1.paa);
                style = "48 + 0x800";
                x = "safeZoneX - 0.25";
                y = "safeZoneY + safeZoneH - 0.8";
                h = "0.75";
                w = "0.75";
            };
            class Kestrel2: Kestrel1 {
                idc = 11;
                text = PATHTOF(data\4500NV2.paa);
                colorText[] = {0,0,0,1-(sunOrMoon*sunOrMoon+(moonIntensity/5))};
            };

            class HUD1: RscText {
                idc = 12;
                type = 0;
                style = 1;
                text = " 0000";
                x = "safeZoneX + 0.08";
                y = "safeZoneY + safeZoneH - 0.51";
                h = "0.09";
                w = "0.108";
                shadow = 0;
                font = "PuristaMedium";
                sizeEx = 0.04;
                colorText[] = {0.0745,0.2196,0.1216,0.7};
                colorBackground[] = {0,0,0,0};
                lineSpacing = 1;
            };
            class HUD2: HUD1 {
                idc = 13;
                y = "safeZoneY + safeZoneH - 0.48";
            };
            class HUD3: HUD1 {
                idc = 14;
                y = "safeZoneY + safeZoneH - 0.45";
            };
            class HUD4: HUD1 {
                idc = 15;
                y = "safeZoneY + safeZoneH - 0.418";
            };
        };
    };

    class ACE_KestrelWheel {
        onload = QUOTE(_this call FUNC(onLoadKestrelWheel));
        //onunload = "";
        idd = -1;
        movingEnable = 0;
        enableDisplay = 1;
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        enablesimulation = 1;

        class controls {
            class Wheel: RscPicture {
                idc = 1;
                type = 0;
                style = "48 + 0x800";
                text = PATHTOF(data\kestrel_0.paa);
                x = "safeZoneX + 0.07";
                y = "safeZoneY + safeZoneH - 0.76";
                h = "0.15";
                w = "0.15";
            };
        };
    };

    // helper class to prevent flickering. Used together with preloadTitleRsc command.
    class ACE_Kestrel_Preload {
        idd = -1;
        movingEnable = 0;
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        class controls {
            class Preload_0: RscPicture {
                text = PATHTOF(data\kestrel_0.paa);
            };
            class Preload_1: Preload_0 {
                text = PATHTOF(data\kestrel_1.paa);
            };
            class Preload_2: Preload_0 {
                text = PATHTOF(data\kestrel_2.paa);
            };
            class Preload_3: Preload_0 {
                text = PATHTOF(data\kestrel_3.paa);
            };
            class Preload_4: Preload_0 {
                text = PATHTOF(data\kestrel_4.paa);
            };
            class Preload_5: Preload_0 {
                text = PATHTOF(data\kestrel_5.paa);
            };
            class Preload_6: Preload_0 {
                text = PATHTOF(data\kestrel_6.paa);
            };
            class Preload_7: Preload_0 {
                text = PATHTOF(data\kestrel_7.paa);
            };
            class Preload_8: Preload_0 {
                text = PATHTOF(data\kestrel_8.paa);
            };
            class Preload_9: Preload_0 {
                text = PATHTOF(data\kestrel_9.paa);
            };
            /*class Preload_A: Preload_0 {
                text = PATHTOF(data\4500NV.paa);
            };
            class Preload_B: Preload_0 {
                text = PATHTOF(data\4500NV1.paa);
            };
            class Preload_C: Preload_0 {
                text = PATHTOF(data\4500NV2.paa);
            };*/
        };
    };
};
