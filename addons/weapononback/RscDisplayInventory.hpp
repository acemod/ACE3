class RscActiveText;

class RscDisplayInventory {
    class controls {
        class GVAR(weaponImage): RscActiveText {
            idc = IDC_WEAPON_IMAGE;
            style = "0x30 + 0x800";
            color[] = {1, 1, 1, 1};
            colorFocused[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorBackground[] = {1, 1, 1, 0.1};
            colorBackgroundSelected[] = {1, 1, 1, 0.1};
            onLoad = "_this#0 ctrlEnable false";
        };
    };
};
