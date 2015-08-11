class IGUIBack;
class RscTitles {
    class GVAR(Bar) {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(barDisplay)),_this select 0)]);
        duration = 10e10;
        class controls {
            // Background
            class back: IGUIBack {
                idc = 2202;
                x = 0.025 * safezoneW + safezoneX;
                y = (0.98 - 0.0025) * safezoneH + safezoneY;
                w = 0.1 * safezoneW;
                h = 0.0025 * safezoneH;
            };
            // Bar
            class bar: IGUIBack {
                idc = 2203;
                x = 0.025 * safezoneW + safezoneX;
                y = (0.98 - 0.0025) * safezoneH + safezoneY;
                w = 0; // Applied in PFH
                h = 0.0025 * safezoneH;
            };
        };
    };
};
