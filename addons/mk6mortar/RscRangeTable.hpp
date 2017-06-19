class ACE_82mm_RangeTable_Dialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['ACE_82mm_RangeTable_Dialog', _this select 0];";
    objects[] = {};

    class ControlsBackground {
        class TableBackground: RscPicture {
            idc = -1;
            text = QPATHTOF(UI\RangeTable_background.paa);
            x = "18 *(safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "16.2634559672906 * (safeZoneH / 40)";
            h = "23 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {1,1,1,1};
        };
        class ChargeBackground: RscText {
            idc = -1;
            x = "14 *(safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "4 * (safeZoneH / 40)";
            h = "5 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0,0,0,1};
        };
    };
    class controls {
        class TheTable: RscListNBox {
            idc = 20001;
            // style = ST_CENTER + ST_MULTI + LB_TEXTURES;
            // style = ST_LEFT + ST_MULTI + LB_TEXTURES;
            // style = LB_MULTI                     + ST_LEFT; // Style
            x = "18 *(safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "3.76 * ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "16.2634559672906 * (safeZoneH / 40)";
            h = "20.24 * ((safeZoneH / 1.2) / 25)";
            columns[] = {(10/867),(86/867),(171/867),(238/867),(320/867),(405/867),
            (485/867),(546/867),(607/867),(668/867),(729/867),(790/867)};
            rowHeight = 0.015 * safeZoneH;
            sizeEx = "0.014 * safeZoneH";
            font = "EtelkaMonospacePro";
            drawSideArrows = 1;
            idcLeft = 14124;
            idcRight = 412343243;
            colorText[] = {0, 0, 0, 1};
            shadow = "0";
            // colorBorder[] = {1,0,0,1};
            // colorBackground[] = {1, 0, 0, 1};
            colorSelectBackground[] = {0, 0, 0, 0.025};
            colorSelectBackground2[] = {0, 0, 0, 0.025};
            colorScrollbar[] = {0.95,0,0.95,1};
            class ListScrollBar: ScrollBar{
                color[] = {0,0,0,0.6};
            };
        };
        class ChargeListBox: RscListbox {
            idc = 1501;
            style = ST_RIGHT;
            x = "14 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "4 * (safeZoneH / 40)";
            h = "5 * ((safeZoneH / 1.2) / 25)";
            onLBSelChanged = QUOTE(_this call FUNC(rangeTablePageChange));
        };
        class CloseBackground: RscText {
            idc = -1;
            x = "33.7634559672906 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "0.5 * (safeZoneH / 40)";
            h = "0.5 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0,0,0,0.5};
        };
        class CloseActiveText: RscActiveText {
            idc = -1;
            style = 48;
            color[] = {1,1,1,0.7};
            text = "A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = "33.7634559672906 *(safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "0.5 * (safeZoneH / 40)";
            h = "0.5 * ((safeZoneH / 1.2) / 25)";
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
            tooltip = "Close";
            onButtonClick = "closeDialog 0";
        };
    };
};
