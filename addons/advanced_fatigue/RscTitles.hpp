class RscProgress;
class RscPicture;
class RscControlsGroupNoScrollBars;
class RscTitles {
    class ACE_RscHUDHelper {
        class controls {
            class GVAR(staminaBarContainer): RscControlsGroupNoScrollBars {
                idc = -1;
                onLoad = QUOTE(_this call EFUNC(ui,registerHUDElement));
                condition = QUOTE(GVAR(enableStaminaBar) && {(vehicle ACE_player) == ACE_player});
                x = IGUI_GRID_STAMINA_X;
                y = IGUI_GRID_STAMINA_Y;
                w = 10 * IGUI_GRID_STAMINA_W;
                h = 0.15 * IGUI_GRID_STAMINA_H;
                class controls {
                    class GVAR(staminaBar): RscPicture {
                        idc = 10;
                        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(staminaBar),_this select 0)]);
                        x = 0;
                        y = 0;
                        w = 10 * IGUI_GRID_STAMINA_W;
                        h = 0.15 * IGUI_GRID_STAMINA_H;
                        text = QUOTE(a3\ui_f\data\igui\rscingameui\rscunitinfo\stamina_ca.paa);
                    };
                };
            };
        };
    };
};
