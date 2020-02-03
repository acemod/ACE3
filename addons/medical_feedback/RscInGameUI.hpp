
class RscPictureKeepAspect;

#define W_GRID(num) (num * (((safezoneW / safezoneH) min 1.2) / 40))
#define H_GRID(num) (num * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))

#define X_STANCE_BG ((safezoneX + safezoneW) - W_GRID(3.7) - W_GRID(0.5))
#define Y_STANCE_BG (safezoneY + H_GRID(0.8))
#define W_STANCE_BG W_GRID(3.7)
#define H_STANCE_BG H_GRID(3.7)

class RscInGameUI {
    class RscStanceInfo {
        controls[] += { QGVAR(BloodVolumeInfoIndicator) };
        class GVAR(BloodVolumeInfoIndicator): RscPictureKeepAspect {
            idc = 100205;
            onLoad = uiNamespace setVariable [QGVAR(BloodVolumeInfoIndicator), _this select 0];
            text = "";
            x = (profilenamespace getVariable ["IGUI_GRID_STANCE_X", X_STANCE_BG]);
            y = (profilenamespace getVariable ["IGUI_GRID_STANCE_Y", Y_STANCE_BG]);
            w = W_STANCE_BG / 4;
            h = H_STANCE_BG / 4;
        };
    };
};
