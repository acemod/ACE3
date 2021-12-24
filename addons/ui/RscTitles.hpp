#define SPEED_INDICATOR_W (IGUI_GRID_STANCE_WAbs / 2)
#define SPEED_INDICATOR_H (IGUI_GRID_STANCE_HAbs / 3.5)
#define SPEED_INDICATOR_Y_OFFSET (IGUI_GRID_STANCE_HAbs / 4.25)

class RscPictureKeepAspect;

class RscTitles {
    class GVAR(speedIndicatorDisplay) {
        idd = -1;
        movingEnable = "true";
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 999999;
        fadeIn = 0;
        fadeOut = 0;
        name = QGVAR(speedIndicatorDisplay);
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(speedIndicatorDisplay),_this select 0)]);
        class controls {
            class speedIndicator: RscPictureKeepAspect {
                onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(speedIndicator),_this select 0)]);
                idc = 10;
                x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs / 2 - SPEED_INDICATOR_W / 2;
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs - SPEED_INDICATOR_Y_OFFSET;
                w = SPEED_INDICATOR_W;
                h = SPEED_INDICATOR_H;
                text = "";
            };
        };
    };
};
