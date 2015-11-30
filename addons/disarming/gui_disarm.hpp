//The disarming dialog
//Meant to mimic the real BIS inventory (so people understand how to use it)

class RscText;
class RscPicture;
class RscActiveText;
class RscListBox;

//Use the definese from
#define X_BIS(num) (num * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2))
#define Y_BIS(num) (num * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))
#define W_BIS(num) (num * (((safezoneW / safezoneH) min 1.2) / 40))
#define H_BIS(num) (num * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))

#define X_MAKEITBIGGA(num) (num * (safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH)/2))
#define Y_MAKEITBIGGA(num) (num * (safeZoneH / 30) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2))
#define W_MAKEITBIGGA(num) (num * (safeZoneH / 40))
#define H_MAKEITBIGGA(num) (num * (safeZoneH / 30))

#define X_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QEGVAR(inventory,inventoryDisplaySize)), 0)]), X_BIS(num), X_MAKEITBIGGA(num))])
#define Y_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QEGVAR(inventory,inventoryDisplaySize)), 0)]), Y_BIS(num), Y_MAKEITBIGGA(num))])
#define W_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QEGVAR(inventory,inventoryDisplaySize)), 0)]), W_BIS(num), W_MAKEITBIGGA(num))])
#define H_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QEGVAR(inventory,inventoryDisplaySize)), 0)]), H_BIS(num), H_MAKEITBIGGA(num))])

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
        dragValidBgr[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])",0.5};
        dragInvalidBgr[] = {"(profilenamespace getVariable ['IGUI_ERROR_RGB_R',0.8])","(profilenamespace getVariable ['IGUI_ERROR_RGB_G',0.0])","(profilenamespace getVariable ['IGUI_ERROR_RGB_B',0.0])",0.5};
        dragValidBar[] = {"(profilenamespace getVariable ['IGUI_WARNING_RGB_R',0.8])","(profilenamespace getVariable ['IGUI_WARNING_RGB_G',0.5])","(profilenamespace getVariable ['IGUI_WARNING_RGB_B',0.0])",0.5};
        dragInvalidBar[] = {"(profilenamespace getVariable ['IGUI_ERROR_RGB_R',0.8])","(profilenamespace getVariable ['IGUI_ERROR_RGB_G',0.0])","(profilenamespace getVariable ['IGUI_ERROR_RGB_B',0.0])",0.5};
        progressBar[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])",1};
        progressBarBgr[] = {"(profilenamespace getVariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getVariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getVariable ['IGUI_BCG_RGB_B',1])",0.75};
        highlight[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])",0.5};
    };

    class controlsBackground {};

    class controls {
        class CA_ContainerBackground: RscText {
            idc = -1;
            x = X_PART(1);
            y = Y_PART(1);
            w = W_PART(12);
            h = H_PART(22.5);
            colorBackground[] = {0.05,0.05,0.05,0.7};
        };
        class CA_PlayerBackground: RscText {
            idc = -1;
            x = X_PART(14.6);
            y = Y_PART(2);
            w = W_PART(24.4);
            h = H_PART(21.5);
            colorBackground[] = {0.05,0.05,0.05,0.7};
        };
        class TitleBackground: RscText {
            idc = -1;
            x = X_PART(14.6);
            y = Y_PART(1);
            w = W_PART(24.4);
            h = H_PART(1);
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class PlayersName: RscText {
            idc = 111;
            // text = "Player name here:";
            x = X_PART(15.6);
            y = Y_PART(1);
            w = W_PART(19.8);
            h = H_PART(1);
        };
        class RankBackground: RscText {
            idc = -1;
            x = X_PART(15.1);
            y = Y_PART(1.25);
            w = W_PART(0.6);
            h = H_PART(0.6);
            colorBackground[] = {1,1,1,0.2};
        };
        class RankPicture: RscPicture {
            idc = 1203;
            // text = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
            x = X_PART(15.1);
            y = Y_PART(1.25);
            w = W_PART(0.6);
            h = H_PART(0.6);
        };
        class ButtonBack: RscActiveText {
            idc = -1;
            style = 48;
            color[] = {1,1,1,0.7};
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = X_PART(38);
            y = Y_PART(1);
            w = W_PART(1);
            h = H_PART(1);
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
            tooltip = "$STR_DISP_OPT_CLOSE";
            onButtonClick = "closeDialog 0";
        };
        class ExternalContainerBackground: RscPicture {
            colorText[] = {1,1,1,0.1};
            idc = -1;
            x = X_PART(1.5);
            y = Y_PART(3.7);
            w = W_PART(11);
            h = H_PART(18.4);
        };
        class PlayerContainerBackground: ExternalContainerBackground {
            idc = -1;
            x = X_PART(15.1);
            y = Y_PART(6);
            w = W_PART(11);
            h = H_PART(14);
        };
        class GroundTitleBackground: RscText {
            idc = -1;
            x = X_PART(1);
            y = Y_PART(1);
            w = W_PART(12);
            h = H_PART(1);
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class GroundName: RscText {
            idc = -1;
            text = "$STR_cfgVehicles_WeaponHolder0"; //"ground"
            x = X_PART(1);
            y = Y_PART(1);
            w = W_PART(12);
            h = H_PART(1);
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
            x = X_PART(1.5);
            y = Y_PART(2.5);
            w = W_PART(11);
            h = H_PART(21);
        };
        class UniformContainer: GroundContainer {
            idc = 633;
            canDrag = 1;
            x = X_PART(15.1);
        };
    };
};
