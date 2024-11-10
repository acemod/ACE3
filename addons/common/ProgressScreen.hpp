class GVAR(ProgressBar_Dialog) {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgProgress)),_this select 0)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ctrlProgressBG)),(_this select 0) displayCtrl 1)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ctrlProgressBar)),(_this select 0) displayCtrl 2)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ctrlProgressBarTitle)),(_this select 0) displayCtrl 3)];);
    objects[] = {};

    class controlsBackground {
        class Background: ctrlMapEmpty {
            idc = 101;
            moving = 0;
            fade = 1;
            font = "TahomaB";
            text = "";
            sizeEx = 0;
            lineSpacing = 0;
            style = 48;
            type = 101;
            size = 1;
            colorBackground[] = {0, 0, 0, 0.0};
            colorText[] = {0, 0, 0, 0};
            x = "safeZoneX";
            y = "safeZoneY";
            w = "safeZoneW";
            h = "safeZoneH";
        };
        class TitleBackground: ACE_gui_staticBase {
            idc = 1;
            style = ST_CENTER;
            sizeEx = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {0, 0, 0, 0.5};
            colorText[] = {1, 1, 1, 1};
            x = "1 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            y = "0 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            w = "38 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
        };
        class Progress: ACE_gui_RscProgress {
            idc = 2;
            x = "1.2 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            y = "0.1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            w = "38 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            colorFrame[] = {1,1,1,0.5};
            colorBar[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
            texture = "#(argb,8,8,3)color(1,1,1,0.7)";
        };
        class TitleText: TitleBackground {
            idc = 3;
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};
