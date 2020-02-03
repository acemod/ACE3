
class RscPictureKeepAspect;
class RscInGameUI {
    class RscStanceInfo {
        controls[] += {QGVAR(BloodVolumeInfoIndicator)};
        class GVAR(BloodVolumeInfoIndicator): RscPictureKeepAspect {
            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(BloodVolumeInfoIndicator),_this select 0)]);
            x = IGUI_GRID_STANCE_X;
            y = IGUI_GRID_STANCE_Y;
            w = IGUI_GRID_STANCE_WAbs / 4;
            h = IGUI_GRID_STANCE_HAbs / 4;
        };
    };
};
