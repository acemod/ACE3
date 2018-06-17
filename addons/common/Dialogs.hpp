#define PROGRESS_BAR_POSITION \
    x = profileNamespace getVariable ['TRIPLES(IGUI,GVAR(gridProgressBar),X)', 1 * GUI_GRID_W + GUI_GRID_CENTER_X];\
    y = profileNamespace getVariable ['TRIPLES(IGUI,GVAR(gridProgressBar),Y)', GUI_GRID_CENTER_Y];\
    w = 38 * GUI_GRID_W;\
    h = 1 * GUI_GRID_H

class GVAR(progressBarDialog) {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(\
        params ['_display'];\
        uiNamespace setVariable [ARR_2(QQGVAR(progressBar), _display displayCtrl 2500)];\
        uiNamespace setVariable [ARR_2(QQGVAR(progressTitle), _display displayCtrl 2501)];\
    );
    class controlsBackground {
        class TitleBackground: RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.5};
            PROGRESS_BAR_POSITION;
        };
        class Progress: RscProgress {
            idc = 2500;
            colorBar[] = GUI_BCG_COLOR;
            colorFrame[] = {0, 0, 0, 0.7};
            texture = "#(argb,8,8,3)color(1,1,1,0.7)";
            PROGRESS_BAR_POSITION;
        };
        class Title: RscText {
            idc = 2501;
            style = 2;
            sizeEx = GUI_GRID_H;
            colorText[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0};
            PROGRESS_BAR_POSITION;
        };
    };
};

class GVAR(disableInputDialog) {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(disableInputDialog), _this select 0)]);
    class controlsBackground {
        class Background: RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0};
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
        };
    };
};
