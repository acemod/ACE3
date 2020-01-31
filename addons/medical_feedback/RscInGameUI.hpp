
class RscPictureKeepAspect;
class RscInGameUI {
    class RscStanceInfo {
        controls[] += { "BloodVolumeInfoControlGroup" };
        class BloodVolumeInfoControlGroup: RscPictureKeepAspect {
            idc = 205;
            onLoad = "uiNamespace setVariable ['BloodVolumeInfoControlGroup', _this select 0]";
            text = "";
            x = "(profilenamespace getVariable ['IGUI_GRID_STANCE_X', ((safezoneX + safezoneW) - (3.7 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.5 * (((safezoneW / safezoneH) min 1.2) / 40))])";
            y = "(profilenamespace getVariable ['IGUI_GRID_STANCE_Y', (safezoneY + 0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
            w = "(3.7 * (((safezoneW / safezoneH) min 1.2) / 40)) / 4";
            h = "(3.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) / 4";
        };
    };
};
