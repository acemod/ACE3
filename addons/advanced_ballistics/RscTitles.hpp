class RscTitles {
    class RscProtractor {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(rscProtractor),_this select 0)]);
        movingEnable = 0;
        duration = 1e10;
        fadeIn = "false";
        fadeOut = "false";
        class controls {
            class RscProtractorBase {
                idc = 132950;
                type = 0;
                style = 48;
                font = "TahomaB";
                colorBackground[] = {0, 0, 0, 0};
                colorText[] = {1, 1, 1, 1};
                x = "SafeZoneX + 0.001";
                y = "SafeZoneY + 0.001";
                w = 0.2;
                h = 0.2*4/3;
                size = 0.034;
                sizeEx = 0.027;
                text = QPATHTOF(UI\protractor.paa);
            };
            class RscProtractorMarker: RscProtractorBase {
                idc = 132951;
                text = QPATHTOF(UI\protractor_marker.paa);
            };
        };
    };
};
