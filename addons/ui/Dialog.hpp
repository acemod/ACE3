#define SPEED_INDICATOR_W (IGUI_GRID_STANCE_WAbs / 2)
#define SPEED_INDICATOR_H (IGUI_GRID_STANCE_HAbs / 3.5)
#define SPEED_INDICATOR_Y_OFFSET (IGUI_GRID_STANCE_HAbs / 4.25)

class RscControlsGroupNoScrollbars;
class RscPictureKeepAspect;

class GVAR(SpeedIndicatorContainer): RscControlsGroupNoScrollbars {
    x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs / 2 - SPEED_INDICATOR_W / 2;
    y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs - SPEED_INDICATOR_Y_OFFSET;
    w = SPEED_INDICATOR_W;
    h = SPEED_INDICATOR_H;
    class Controls {
        class SpeedIndicator: RscPictureKeepAspect {
            idc = 10;
            x = 0;
            y = 0;
            w = SPEED_INDICATOR_W;
            h = SPEED_INDICATOR_H;
            text = "";
        };
    };
};
