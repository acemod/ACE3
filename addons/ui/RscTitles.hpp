#define SPEED_INDICATOR_W (IGUI_GRID_STANCE_WAbs / 2)
#define SPEED_INDICATOR_H (IGUI_GRID_STANCE_HAbs / 3.5)
#define SPEED_INDICATOR_Y_OFFSET (IGUI_GRID_STANCE_HAbs / 4.25)

class RscPictureKeepAspect;

class RscTitles {
    class ACE_RscHUDHelper {
        class controls {
            class GVAR(speedIndicator): RscPictureKeepAspect {
                onLoad = QUOTE(_this call EFUNC(common,registerHUDElement));
                onUnload = QUOTE(_this call EFUNC(common,removeHUDElement));
                condition = QUOTE(GVAR(enableSpeedIndicator) && {(vehicle ACE_player) == ACE_player});
                idc = -1;
                x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs / 2 - SPEED_INDICATOR_W / 2;
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs - SPEED_INDICATOR_Y_OFFSET;
                w = SPEED_INDICATOR_W;
                h = SPEED_INDICATOR_H;
                text = "";
            };
        };
    };
};
