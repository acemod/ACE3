class RscPictureKeepAspect;
class RscInGameUI {
    class RscStanceInfo {
        controls[] += {QGVAR(bloodVolumeIndicator)};
        class GVAR(bloodVolumeIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(bloodVolumeIndicator),_this select 0)]);
            x = IGUI_GRID_STANCE_X;
            y = IGUI_GRID_STANCE_Y;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };
    };
};
