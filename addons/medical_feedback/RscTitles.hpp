
class RscPictureKeepAspect;

class RscTitles {
#ifdef DISABLE_VANILLA_BLOOD_TEXTURES
    // Disables blood texture overlay
    class RscHealthTextures {
        class controls {
            class Flame_1;
            class Blood_1: Flame_1 {
                text = ""; //"A3\Ui_f\data\igui\rsctitles\HealthTextures\blood_lower_ca.paa";
            };
            class Blood_2: Flame_1 {
                text = ""; //"A3\Ui_f\data\igui\rsctitles\HealthTextures\blood_middle_ca.paa";
            };
            class Blood_3: Flame_1 {
                text = ""; //"A3\Ui_f\data\igui\rsctitles\HealthTextures\blood_upper_ca.paa";
            };
        };
    };
#endif
    class ACE_RscHUDHelper {
        class controls {
            class GVAR(bloodVolumeIndicator): RscPictureKeepAspect {
                idc = -1;
                onLoad = QUOTE(_this call EFUNC(ui,registerHUDElement));
                onUnload = QUOTE(_this call EFUNC(ui,removeHUDElement));
                condition = "";
                x = IGUI_GRID_STANCE_X;
                y = IGUI_GRID_STANCE_Y;
                w = IGUI_GRID_STANCE_WAbs / 4;
                h = IGUI_GRID_STANCE_HAbs / 4;
                text = "";
            };
            class GVAR(stateIndicator1): GVAR(bloodVolumeIndicator) {
                condition = QUOTE(GVAR(enableHUDIndicators) && {(vehicle ACE_player) == ACE_player});
                x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs * 3 / 4;
                w = IGUI_GRID_STANCE_WAbs / 4;
                h = IGUI_GRID_STANCE_HAbs / 4;
            };
            class GVAR(stateIndicator2): GVAR(stateIndicator1) {
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs / 4;
            };
            class GVAR(stateIndicator3): GVAR(stateIndicator1) {
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs * 2 / 4;
            };
        };
    };
};
