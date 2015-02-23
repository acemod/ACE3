class RscText;
class RscListBox;

class GVAR(friskInventory) {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PABST_friskInventory', _this select 0];";
    duration = 2147483647;
    fadein = 0;
    fadeout = 0;

    class controlsBackground {};

    class controls {

        class CA_ContainerBackground: RscText {
            idc = -1;
            x = "7.5 *         (safeZoneH / 40) +            (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1 *         ((safeZoneH / 1.2) / 25) +    (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "12 *        (safeZoneH / 40)";
            h = "22.5 *      ((safeZoneH / 1.2) / 25)";
            colorBackground[] = {0.05,0.05,0.05,0.7};
        };

        class CA_ContainerBackground2: CA_ContainerBackground {
            idc = -1;
            x = "20.5 *         (safeZoneH / 40) +            (safezoneX + (safezoneW - safeZoneH)/2)";
        };


        class GroundContainer: RscListBox {
            idc = 632;
            sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            sizeEx2 = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            canDrag = 1;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            itemBackground[] = {1,1,1,0.1};
            itemSpacing = 0.001;
            x = "8 *        (safeZoneH / 40) +           (safezoneX + (safezoneW - safeZoneH)/2)";
            y = "1.5 *        ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
            w = "11 *         (safeZoneH / 40)";
            h = "21.5 *       ((safeZoneH / 1.2) / 25)";
        };
        class TargetContainer: GroundContainer {
            idc = 633;
            canDrag = 0;
            x = "21 *        (safeZoneH / 40) +           (safezoneX + (safezoneW - safeZoneH)/2)";
        };
    };
};

