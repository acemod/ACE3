class RscPicture;

class RscTitles {
    class RscACE_Goggles_BaseTitle {
        idd = -1;
        onLoad = "uiNamespace setVariable ['ACE_Goggles_Display', _this select 0]";
        onUnload = "uiNamespace setVariable ['ACE_Goggles_Display', displayNull]";
        fadeIn = 0.5;
        fadeOut = 0.5;
        movingEnable = 0;
        duration = 10e10;
        name = "RscACE_Goggles_BaseTitle";
        class controls;
    };

    class RscACE_Goggles: RscACE_Goggles_BaseTitle {
        idd = IDD_GOGGLES;
        name = "RscACE_Goggles";
        class controls {
            class gogglesImage: RscPicture {
                idc = IDC_GOGGLES_OVERLAY;
                x = "safeZoneX";
                y = "safeZoneY";
                w = "safeZoneW";
                h = "safeZoneH";
            };
        };
    };

    class RscACE_GogglesEffects: RscACE_Goggles_BaseTitle {
        idd = IDD_GOGGLESEFFECTS;
        onLoad = "uiNamespace setVariable ['ACE_Goggles_DisplayEffects', _this select 0]";
        onUnload = "uiNamespace setVariable ['ACE_Goggles_DisplayEffects', displayNull]";
        name = "RscACE_GogglesEffects";
        fadeIn = 0;
        fadeOut = 0.5;
        class controls {
            class dirtImage: RscPicture {
                idc = IDC_GOGGLESEFFECTS_DIRT;
                x = "safeZoneX";
                y = "safeZoneY";
                w = "safeZoneW";
                h = "safeZoneH";
            };
            class dustImage: RscPicture {
                idc = IDC_GOGGLESEFFECTS_DUST;
                x = "safeZoneX";
                y = "safeZoneY";
                w = "safeZoneW";
                h = "safeZoneH";
            };
        };
    };
};
