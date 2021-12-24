class RscControlsGroupNoScrollbars;
class RscPictureKeepAspect;

class GVAR(HUDIndicatorsContainer): RscControlsGroupNoScrollbars {
    x = IGUI_GRID_STANCE_X;
    y = IGUI_GRID_STANCE_Y;
    w = IGUI_GRID_STANCE_WAbs;
    h = IGUI_GRID_STANCE_HAbs;
    class Controls {
        class GVAR(bloodVolumeIndicator): RscPictureKeepAspect {
            idc = IDC_BLOODVOLUME;
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(bloodVolumeIndicator),_this select 0)]);
            x = 0;
            y = 0;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
            text = "";
        };
         class GVAR(stateIndicator1): RscPictureKeepAspect {
            idc = IDC_TOURNIQUET;
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator1), _this select 0)]);
            x = IGUI_GRID_STANCE_WAbs * 3 / 4;
            y = 0;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
            text = "";
        };
        class GVAR(stateIndicator2): GVAR(stateIndicator1) {
            idc = IDC_SPLINT;
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator2), _this select 0)]);
            y = IGUI_GRID_STANCE_HAbs / 4;
        };
        class GVAR(stateIndicator3): GVAR(stateIndicator1) {
            idc = IDC_FRACTURE;
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator3), _this select 0)]);
            y = IGUI_GRID_STANCE_HAbs * 2 / 4;
        };
    };
};
