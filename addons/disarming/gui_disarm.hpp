//The disarming dialog
//Meant to mimic the real BIS inventory (so people understand how to use it)

class RscText;
class RscPicture;
class RscActiveText;
class RscListBox;

class GVAR(remoteInventory) {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['ACE_remoteInventory', _this select 0];";
    duration = 2147483647;
    fadein = 0;
    fadeout = 0;

    class Colors {
        dragValidBgr[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",0.5};
        dragInvalidBgr[] = {"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])","(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])",0.5};
        dragValidBar[] = {"(profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.5])","(profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.0])",0.5};
        dragInvalidBar[] = {"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])","(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])",0.5};
        progressBar[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",1};
        progressBarBgr[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",0.75};
        highlight[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",0.5};
    };

    class controlsBackground {};

    class controls {
        class CA_ContainerBackground: RscText {
            idc = 1001;
            x = "1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "2 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "12 * (safeZoneH / 40)";
            h = "22 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0.05,0.05,0.05,0.7};
        };
        class CA_PlayerBackground: RscText {
            idc = 1002;
            x = "14.6 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "2 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "24.4 * (safeZoneH / 40)";
            h = "22 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0.05,0.05,0.05,0.7};
        };
        class TitleBackground: RscText {
            idc = 1020;
            x = "14.6 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "24.4 * (safeZoneH / 40)";
            h = "1 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class PlayersName: RscText {
            idc = 111;
            text = "Player name:";
            x = "15.6 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "19.8 * (safeZoneH / 40)";
            h = "1 * ((safeZoneH / 1.2) / 25)";
        };
        class RankBackground: RscText {
            idc = 1014;
            x = "15.1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1.25 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "0.6 * (safeZoneH / 40)";
            h = "0.6 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {1,1,1,0.2};
        };
        class RankPicture: RscPicture {
            idc = 1203;
            text = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
            x = "15.1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1.25 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "0.6 * (safeZoneH / 40)";
            h = "0.6 * ((safeZoneH / 1.2) / 25)";
        };
        class ButtonBack: RscActiveText {
            idc = 2;
            style = 48;
            color[] = {1,1,1,0.7};
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = "38 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "1 * (safeZoneH / 40)";
            h = "1 * ((safeZoneH / 1.2) / 25)";
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
            tooltip = "$str_disp_close";
        };
        class ExternalContainerBackground: RscPicture {
            colorText[] = {1,1,1,0.1};
            idc = 1240;
            x = "1.5 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "3.7 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "11 * (safeZoneH / 40)";
            h = "18.4 * ((safeZoneH / 1.2) / 25)";
        };
        class PlayerContainerBackground: ExternalContainerBackground {
            idc = 1241;
            x = "15.1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "6 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "11 * (safeZoneH / 40)";
            h = "14 * ((safeZoneH / 1.2) / 25)";
        };
        class GroundTitleBackground: RscText {
            idc = 1021;
            x = "1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "12 * (safeZoneH / 40)";
            h = "1 * ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class GroundName: RscText {
            idc = 112;
            text = "$STR_cfgVehicles_WeaponHolder0";
            x = "1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 * ((safeZoneH / 1.2) / 25) +  (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "12 * (safeZoneH / 40)";
            h = "1 * ((safeZoneH / 1.2) / 25)";
        };
        class GroundContainer: RscListBox {
            idc = 632;
            sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            sizeEx2 = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            rowHeight = "1.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            canDrag = 0;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            itemBackground[] = {1,1,1,0.2};
            itemSpacing = 0.001;
            x = "1.5 * (safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "2.5 * ((safeZoneH / 1.2) / 25) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "11 * (safeZoneH / 40)";
            h = "21.5 * ((safeZoneH / 1.2) / 25)";
        };
        class UniformContainer: GroundContainer {
            idc = 633;
            canDrag = 1;
            x = "15.1 * (safeZoneH / 40) +    (safezoneX + (safezoneW - safeZoneH)/2)";
        };
    };
};
