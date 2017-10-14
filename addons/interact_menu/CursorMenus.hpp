class GVAR(cursorMenu) {
    idd = 91919;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgCursorMenu)),_this select 0)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(cursorMenuOpened)),true)]);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(cursorMenuOpened)),false)]);
};
class RscTitles {
    class GVAR(menuBackground) {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(menuBackground)),_this select 0)]);
        onUnload = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(menuBackground)),displayNull)]);
        fadeIn = 0.25;
        fadeOut = 0.25;
        movingEnable = false;
        duration = 10e10;
        name = QGVAR(menuBackground);
        class controls {};
        class controlsBackground {
            class background {
                idc = -1;
                moving = 0;
                font = "TahomaB";
                text = "";
                sizeEx = 0;
                lineSpacing = 0;
                type = 0;
                style = 0;
                size = 1;
                colorBackground[] = {0, 0, 0, 0.65};
                colorText[] = {0, 0, 0, 0};
                x = "safezoneX";
                y = "safezoneY";
                w = "safezoneW";
                h = "safezoneH";
            };
        };
    };
};
