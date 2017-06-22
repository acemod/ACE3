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
                x = 0.118437 * safezoneW + safezoneX;
                y = 0.621 * safezoneH + safezoneY;
                w = 0.20625 * safezoneW;
                h = 0.341 * safezoneH;
            };
            class HeightText: RscText {
                idc = 1100;
                text = "----";
                x = 0.200937 * safezoneW + safezoneX;
                y = 0.764 * safezoneH + safezoneY;
                w = 0.04125 * safezoneW;
                h = 0.033 * safezoneH;
                colorBackground[] = {0,0,0,0};
                colorText[] = {0,0,0,1};
            };
            class DecendRate: RscText {
                idc = 1000;
                text = "--";
                x = 0.21125 * safezoneW + safezoneX;
                y = 0.742 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.022 * safezoneH;
                colorText[] = {0,0,0,1};
            };
            class TimeText: RscText {
                idc = 1001;
                text = "00:00";
                x = 0.206094 * safezoneW + safezoneX;
                y = 0.819 * safezoneH + safezoneY;
                w = 0.0309375 * safezoneW;
                h = 0.022 * safezoneH;
                colorText[] = {0,0,0,1};
            };
        };
    };
};
