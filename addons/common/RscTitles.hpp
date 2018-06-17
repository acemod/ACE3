class GVAR(debug_structuredText): ctrlStructuredText {
    sizeEx = "16 * pixelH";
    size = "16 * pixelH";
};

class RscTitles {
    class ACE_RscHint {
        idd = -1;
        fadeIn = 0.3;
        fadeOut = 0.3;
        duration = 4;
        movingEnable = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_ctrlHint', (_this select 0) displayCtrl 1)]);
        class controls {
            class HintBox: RscStructuredText {
                idc = 1;
                x = safeZoneX + safeZoneW - 12.9 * GUI_GRID_W;
                y = safeZoneY + 0.175 * safeZoneH;
                w = 10 * GUI_GRID_W;
                h = 3 * GUI_GRID_H;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0.1};
                sizeEx = GUI_GRID_H;
            };
        };
    };

    class ACE_RscErrorHint {
        idd = -1;
        fadeIn = 0.3;
        fadeOut = 0.3;
        duration = 999999;
        movingEnable = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_ctrlErrorHint', (_this select 0) displayCtrl 1)]);
        class controls {
            class HintBox: RscStructuredText {
                idc = 1;
                x = 0.3 * safeZoneW + safeZoneX;
                y = 0.4 * safeZoneH + safeZoneY;
                w = 0.4 * safeZoneW;
                h = 0.2 * safeZoneH;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0.8, 0, 0, 0.5};
                sizeEx = GUI_GRID_H;
            };
        };
    };

    class GVAR(watchVariableUI) {
        idd = -1;
        fadeIn = 0;
        fadeOut = 0;
        duration = 999999;
        movingEnable = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(watchVariableUI), _this select 0)]);
        class controls {};
    };
};
