class RscControlsGroupNoScrollbars;
class RscPicture;

class GVAR(StaminaBarContainer): RscControlsGroupNoScrollbars {
    x = "(profilenamespace getvariable [""IGUI_GRID_STAMINA_X"", ((safezoneX + safezoneW) - (10 * (((safezoneW / safezoneH) min 1.2) / 40)) - 4.3 * (((safezoneW / safezoneH) min 1.2) / 40))])";
    y = "(profilenamespace getvariable [""IGUI_GRID_STAMINA_Y"", (safezoneY + 4.05 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
    h = "0.15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

    class Controls {
        class StaminaBar: RscPicture {
            idc = 10;
            x = 0;
            y = 0;
            w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "0.15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            text = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\stamina_ca.paa";
        };
    };
};
