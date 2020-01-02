class GVAR(rangeTableDialog) {
    idd = -1;
    movingEnable = 1;
    onLoad = QUOTE(with uiNameSpace do { GVAR(rangeTableDialog) = _this select 0 };);
    objects[] = {};

    class ControlsBackground {
        class TableBackground: RscPicture {
            idc = -1;
            text = QPATHTOF(UI\RangeTable_background.paa);
            x = "18 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "16.2634559672906 * (safeZoneH / 40)";
            h = "23 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {1,1,1,1};
        };
        class LeftSideBackground: RscText {
            idc = -1;
            x = "13 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "5 * (safeZoneH / 40)";
            h = "23 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0,0,0,0.8};
        };
    };
    class controls {
        class TheTable: RscListNBox {
            idc = IDC_TABLE;
            x = "18 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "3.76 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "16.2634559672906 * (safeZoneH / 40)";
            h = "20.24 * ((safeZoneH / 1.2) / 25)";
            columns[] = {(10/867),(86/867),(171/867),(238/867),(320/867),(405/867),(485/867),(546/867),(607/867),(668/867),(729/867),(790/867)};
            rowHeight = 0.015 * safeZoneH;
            sizeEx = "0.014 * safeZoneH";
            font = "EtelkaMonospacePro";
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            colorText[] = {0, 0, 0, 1};
            shadow = "0";
            colorSelectBackground[] = {0, 0, 0, 0.025};
            colorSelectBackground2[] = {0, 0, 0, 0.025};
            colorScrollbar[] = {0.95,0,0.95,1};
            class ListScrollBar: ScrollBar{
                color[] = {0,0,0,0.6};
            };
        };
        class ChargeListBox: RscListbox {
            idc = IDC_CHARGELIST;
            style = ST_RIGHT;
            x = "13 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "2 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "5 * (safeZoneH / 40)";
            h = "22 * ((safeZoneH / 1.2) / 25)";
            onLBSelChanged = QUOTE([] call FUNC(rangeTableUpdate));
        };
        class elevationHigh: ctrlButton {
            idc = IDC_BUTTON_ELEV_HIGH;
            text = "High";
            onButtonClick = QUOTE([true] call FUNC(rangeTableUpdate));
            x = "13.1 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "1.1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "2.3 * (safeZoneH / 40)";
            h = "0.8 * ((safeZoneH / 1.2) / 25)";
        };
        class elevationLow: elevationHigh {
            idc = IDC_BUTTON_ELEV_LOW;
            text = "Low";
            onButtonClick = QUOTE([false] call FUNC(rangeTableUpdate));
            x = "15.6 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
        };
        class CloseBackground: RscText {
            idc = -1;
            x = "33.7634559672906 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "0.5 * (safeZoneH / 40)";
            h = "0.5 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0,0,0,0.5};
        };
        class CloseActiveText: RscActiveText {
            idc = -1;
            style = 48;
            color[] = {1,1,1,0.7};
            text = "A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = "33.7634559672906 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH) / 2)";
            y = "1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2)) / 2)";
            w = "0.5 * (safeZoneH / 40)";
            h = "0.5 * ((safeZoneH / 1.2) / 25)";
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
            tooltip = "Close";
            onButtonClick = "closeDialog 0";
        };
    };
};
