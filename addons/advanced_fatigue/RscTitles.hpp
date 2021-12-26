class RscProgress;
class RscTitles {
    class ACE_RscHUDHelper {
        class controls {
            class GVAR(staminaBar): RscProgress {
                idc = -1;
                onLoad = QUOTE(_this call EFUNC(common,registerHUDElement));
                condition = QUOTE(GVAR(enableStaminaBar) && {(vehicle ACE_player) == ACE_player});
                x = IGUI_GRID_STAMINA_X;
                y = IGUI_GRID_STAMINA_Y;
                w = 10 * IGUI_GRID_STAMINA_W;
                h = 0.15 * IGUI_GRID_STAMINA_H;
                colorBar[] = {1,1,1,1};
            };
        };
    };
};
