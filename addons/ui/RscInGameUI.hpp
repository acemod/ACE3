#define SPEED_INDICATOR_W (IGUI_GRID_STANCE_WAbs / 2)
#define SPEED_INDICATOR_H (IGUI_GRID_STANCE_HAbs / 3.5)
#define SPEED_INDICATOR_Y_OFFSET (IGUI_GRID_STANCE_HAbs / 4.25)

#undef IGUI_GRID_STANCE_X
#undef IGUI_GRID_STANCE_Y
#define ace_IGUI_GRID_STANCE_X (profilenamespace getvariable ['IGUI_GRID_STANCE_X',IGUI_GRID_STANCE_XDef])
#define ace_IGUI_GRID_STANCE_Y (profilenamespace getvariable ['IGUI_GRID_STANCE_Y',IGUI_GRID_STANCE_YDef])

class RscPictureKeepAspect;
class RscInGameUI {
    class RscStanceInfo {
        controls[] += {QGVAR(speedIndicator)};
        class GVAR(speedIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(speedIndicator),_this select 0)]);
            x = QUOTE(ace_IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs / 2 - SPEED_INDICATOR_W / 2);
            y = QUOTE(ace_IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs - SPEED_INDICATOR_Y_OFFSET);
            w = QUOTE(SPEED_INDICATOR_W);
            h = QUOTE(SPEED_INDICATOR_H);
        };
    };
};
