#define SPEED_INDICATOR_W (IGUI_GRID_STANCE_WAbs / 2)
#define SPEED_INDICATOR_H (IGUI_GRID_STANCE_HAbs / 3.5)
#define SPEED_INDICATOR_Y_OFFSET (IGUI_GRID_STANCE_HAbs / 4.25)

class RscPictureKeepAspect;

class RscTitles {
    // Helper display for componentes adding HUD elements, created automatically on mission load and hidden on pause menu/featureCamera
    // Components should add to the controls class
    class ACE_RscHUDHelper {
        idd = -1;
        onLoad = "uiNamespace setVariable ['ACE_RscHUDHelper', (_this select 0)];";
        movingEnable = 0;
        duration = 999999;
        fadeIn = 0.2;
        fadeOut = 0.2;
        name = "ACE_RscHUDHelper";
        class controls {
            class GVAR(speedIndicator): RscPictureKeepAspect {
                idc = -1;
                onLoad = QUOTE(_this call FUNC(registerHUDElement));
                onUnload = QUOTE(_this call FUNC(removeHUDElement));
                condition = QUOTE(GVAR(enableSpeedIndicator) && {(vehicle ACE_player) == ACE_player});
                x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs / 2 - SPEED_INDICATOR_W / 2;
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs - SPEED_INDICATOR_Y_OFFSET;
                w = SPEED_INDICATOR_W;
                h = SPEED_INDICATOR_H;
                text = "";
            };
        };
    };
};
