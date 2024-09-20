class RscText;
class RscPicture;
class RscTitles {
    class ACE_Altimeter {
        idd = 9935;
        enableSimulation = 1;
        movingEnable = 0;
        fadeIn=0;
        fadeOut=1;
        duration = 10e10;
        onLoad = "uiNamespace setVariable ['ACE_Altimeter', _this select 0];";
        class controls {
            class AltimeterImage: RscPicture {
                idc = 1200;
                text = QPATHTOF(UI\watch_altimeter.paa);
                x = "0.118437 * safeZoneW + safeZoneX";
                y = "0.621 * safeZoneH + safeZoneY";
                w = "0.20625 * safeZoneW";
                h = "0.341 * safeZoneH";
            };
            class HeightText: RscText {
                idc = 1100;
                text = "----";
                x = "0.200937 * safeZoneW + safeZoneX";
                y = "0.764 * safeZoneH + safeZoneY";
                w = "0.04125 * safeZoneW";
                h = "0.033 * safeZoneH";
                colorBackground[] = {0,0,0,0};
                colorText[] = {0,0,0,1};
            };
            class DecendRate: RscText {
                idc = 1000;
                text = "--";
                x = "0.21125 * safeZoneW + safeZoneX";
                y = "0.742 * safeZoneH + safeZoneY";
                w = "0.020625 * safeZoneW";
                h = "0.022 * safeZoneH";
                colorText[] = {0,0,0,1};
            };
            class TimeText: RscText {
                idc = 1001;
                text = "00:00:00";
                x = "0.202094 * safeZoneW + safeZoneX";
                y = "0.819 * safeZoneH + safeZoneY";
                w = "0.0380375 * safeZoneW";
                h = "0.022 * safeZoneH";
                colorText[] = {0,0,0,1};
            };
        };
    };
};
