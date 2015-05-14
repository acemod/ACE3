class GVAR(cursorMenu) {
    idd = 91919;
    movingEnable = false;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgCursorMenu)),_this select 0)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(cursorMenuOpened)),true)]);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(cursorMenuOpened)),false)]);
    objects[] = {};
    /*class controlsBackground {
        class Background {
            idc = 91920;
            moving = 0;
            font = "TahomaB";
            text = "";
            sizeEx = 0;
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 0;
            size = 1;
            colorBackground[] = {0, 0, 0, 0.5};
            colorText[] = {0, 0, 0, 0};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };*/
    class controls {
        class Canvas {
            idc = 91921;
            moving = 0;
            font = "TahomaB";
            text = "";
            sizeEx = 0;
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 0;
            size = 1;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {0, 0, 0, 0};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
};
class RscTitles{
    class RscPicture;
    class RscACE_interact_menu_cursorMenu_background {
        idd = -1;
        onLoad = "uiNamespace setVariable ['RscACE_interact_menu_cursorMenu_background_Display', _this select 0]";
        onUnload = "uiNamespace setVariable ['RscACE_interact_menu_cursorMenu_background_Display', displayNull]";
        fadeIn = 0.25;
        fadeOut = 0.25;
        movingEnable = false;
        duration = 10e10;
        name = "RscACE_testbackground";
        class controls{
            class RscACE_interact_menu_cursorMenu_backgroundPicture: RscPicture {
                idc = -1;
            };
        };
        class controlsBackground {
            class background {
                idc = -1;
                moving = 0;
                font = "TahomaB";
                text = "";
                sizeEx = 0;
                lineSpacing = 0;
                access = 0;
                type = 0;
                style = 0;
                size = 1;
                colorBackground[] = {0, 0, 0, 0.5};
                colorText[] = {0, 0, 0, 0};
                x = "safezoneX";
                y = "safezoneY";
                w = "safezoneW";
                h = "safezoneH";
            };
        };
    };
};