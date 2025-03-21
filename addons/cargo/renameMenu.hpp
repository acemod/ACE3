#include "\z\ace\addons\common\define.hpp"

class GVAR(renameMenu) {
    idd = 314615;
    movingEnable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(menuDisplay),_this select 0)]);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(menuDisplay),nil)]);
    class controlsBackground {
        class HeaderBackground: ACE_gui_backgroundBase {
            idc = -1;
            SizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
            x = "13 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            y = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            w = "13 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            text = "#(argb,8,8,3)color(0,0,0,0)";
        };
        class CenterBackground: HeaderBackground {
            y = "2.1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            h = "2.9 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            text = "#(argb,8,8,3)color(0,0,0,0.8)";
            colorText[] = {0, 0, 0, "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            colorBackground[] = {0, 0, 0, "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
        };
    };

    class controls {
        class HeaderName {
            idc = 1;
            type = CT_STATIC;
            x = "13 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            y = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            w = "13 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            style = QUOTE(ST_LEFT + ST_SHADOW);
            font = "RobotoCondensed";
            SizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            text = CSTRING(renameObjectUI);
        };
        class edit: ACE_gui_editBase {
            onLoad = QUOTE((_this select 0) ctrlSetText (GVAR(interactionVehicle) getVariable [ARR_2(QQGVAR(customName),'')]));
            idc = 100;
            canModify = 1;
            x = "13.1 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            y = "2.3 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            w = "12.8 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "1.5 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            SizeEx = "1.5 * (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 0.7)";
        };
        class btnCancel: ACE_gui_buttonBase {
            text = "$STR_DISP_CANCEL";
            idc = 11;
            x = "13.1 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            y = "3.9 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2)";
            w = "5 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            size = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
            SizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 0.7)";
            animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
            animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
            animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
            animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
            color[] = {1, 1, 1, 1};
            color2[] = {0, 0, 0, 1};
            colorBackgroundFocused[] = {1, 1, 1, 1};
            colorBackground[] = {1, 1, 1, 1};
            colorbackground2[] = {1, 1, 1, 1};
            colorDisabled[] = {1, 1, 1, 1};
            colorFocused[] = {0, 0, 0, 1};
            periodFocus = 1;
            periodOver = 1;
            action = QUOTE(closeDialog 0);
        };
        class btnSave: btnCancel {
            text = ECSTRING(Common,Save);
            idc = 12;
            x = "20.9 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2)";
            action = QUOTE(closeDialog 1; call FUNC(renameObject));
        };
    };
};
