class RscPictureKeepAspect;
class RscInGameUI {
    class RscStanceInfo {
        controls[] += {
            QGVAR(bloodVolumeIndicator),
            QGVAR(tourniquetIndicator),
            QGVAR(splintIndicator)
        };
        class GVAR(bloodVolumeIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(bloodVolumeIndicator),_this select 0)]);
            x = IGUI_GRID_STANCE_X;
            y = IGUI_GRID_STANCE_Y;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };

        class GVAR(tourniquetIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(tourniquetIndicator), _this select 0)]);
            x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs * 3 / 4;
            y = IGUI_GRID_STANCE_Y;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };
        class GVAR(splintIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(splintIndicator), _this select 0)]);
            x = IGUI_GRID_STANCE_X + IGUI_GRID_STANCE_WAbs * 3 / 4;
            y = IGUI_GRID_STANCE_Y + IGUI_GRID_STANCE_HAbs / 4;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };
    };
};
