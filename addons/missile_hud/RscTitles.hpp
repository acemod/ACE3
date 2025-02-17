class RscTitles {
    class GVAR(infoDisplay) {
        idd = -1;
        onLoad = QUOTE(with uiNameSpace do { GVAR(display) = _this select 0 };);
        movingEnable = 0;
        duration = 60;
        fadeIn = "false";
        fadeOut = "false";
        class controls {};
        class controlPrefabs {
            class line: RscControlsGroupNoScrollbars {
                idc = -1;
                x = "3.8 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (profilenamespace getvariable ['IGUI_GRID_WEAPON_X',((safeZoneX + safeZoneW) - (10 * (((safeZoneW / safeZoneH) min 1.2) / 40)) - 4.3 * (((safeZoneW / safeZoneH) min 1.2) / 40))])";
                y = "2.5 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (profilenamespace getVariable ['IGUI_GRID_WEAPON_Y', (safeZoneY + 0.5 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))])";
                w = "10 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
                h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            };
            class text: RscText {
                idc = -1;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = "0";
                y = "0";
                w = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
                h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
                sizeEx = "0.8 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            };
            class icon: RscPictureKeepAspect  {
                idc = -1;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                text = "\a3\Ui_F_Curator\Data\CfgCurator\laser_ca.paa";
                x = "0";
                y = "0";
                w = "(1) * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
                h = "(1) * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            };
        };
    };
};
