class RscPictureKeepAspect;
class RscInGameUI {
    class RscStanceInfo {
        controls[] += {
            QGVAR(bloodVolumeIndicator),
            QGVAR(stateIndicator1),
            QGVAR(stateIndicator2),
            QGVAR(stateIndicator3)
        };
        class GVAR(bloodVolumeIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(bloodVolumeIndicator),_this select 0)]);
            x = IGUI_GRID_STANCE_X;
            y = IGUI_GRID_STANCE_Y;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };

        class GVAR(stateIndicator1): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator1), _this select 0)]);
            x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs * 3 / 4;
            y = IGUI_GRID_STANCE_Y;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };
        class GVAR(stateIndicator2): GVAR(stateIndicator1) {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator2), _this select 0)]);
            y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs / 4;
        };
        class GVAR(stateIndicator3): GVAR(stateIndicator1) {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(stateIndicator3), _this select 0)]);
            y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs * 2 / 4;
        };
    };
};
