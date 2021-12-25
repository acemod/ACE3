
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
    class GVAR(HUDIndicatorsDisplay) {
        idd = -1;
        movingEnable = "true";
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 999999;
        fadeIn = 0;
        fadeOut = 0;
        name = QGVAR(HUDIndicatorsDisplay);
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(HUDIndicatorsDisplay),_this select 0)]);
        class controls {
            class GVAR(bloodVolumeIndicator): RscPictureKeepAspect {
                idc = IDC_BLOODVOLUME;
                onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(bloodVolumeIndicator),_this select 0)]);
                x = IGUI_GRID_STANCE_X;
                y = IGUI_GRID_STANCE_Y;
                w = IGUI_GRID_STANCE_WAbs / 4;
                h = IGUI_GRID_STANCE_HAbs / 4;
                text = "";
            };
            class GVAR(stateIndicator1): RscPictureKeepAspect {
                idc = IDC_TOURNIQUET;
                onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator1), _this select 0)]);
                x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs * 3 / 4;
                y = IGUI_GRID_STANCE_Y;
                w = IGUI_GRID_STANCE_WAbs / 4;
                h = IGUI_GRID_STANCE_HAbs / 4;
                text = "";
            };
            class GVAR(stateIndicator2): GVAR(stateIndicator1) {
                idc = IDC_SPLINT;
                onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator2), _this select 0)]);
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs / 4;
            };
            class GVAR(stateIndicator3): GVAR(stateIndicator1) {
                idc = IDC_FRACTURE;
                onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator3), _this select 0)]);
                y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs * 2 / 4;
            };
        };
    };
};
