class RscControlsGroupNoScrollbars;
class RscPicture;

class GVAR(StaminaBarContainer): RscControlsGroupNoScrollbars {
    x = "(profilenamespace getvariable [""IGUI_GRID_STAMINA_X"", ((safeZoneX + safeZoneW) - (10 * (((safeZoneW / safeZoneH) min 1.2) / 40)) - 4.3 * (((safeZoneW / safeZoneH) min 1.2) / 40))])";
    y = "(profilenamespace getvariable [""IGUI_GRID_STAMINA_Y"", (safeZoneY + 4.05 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))])";
    w = "10 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
    h = "0.15 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";

    class Controls {
        class StaminaBar: RscPicture {
            idc = 10;
            x = 0;
            y = 0;
            w = "10 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "0.15 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            text = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\stamina_ca.paa";
        };
    };
};
