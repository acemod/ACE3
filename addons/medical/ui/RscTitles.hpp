class ACE_gui_backgroundBase;
class ACE_gui_listBoxBase;

class Rsctitles {
  class GVAR(DisplayInformation) {
  duration = 10e10;
  idd = 1111;
  movingenable = 0;
  onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QUOTE(GVAR(DisplayInformation))), _this select 0)]);
  onUnload = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QUOTE(GVAR(DisplayInformation))), nil)]);
    class controlsBackground {
        class bodyImgBackground: ACE_gui_backgroundBase {
            idc = -1;
            x = "safezoneX + (2.5 * (((safezoneW / safezoneH) min 1.2) / 40))";
            y = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            w = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "8.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
            colorBackground[] = {1,1,1,1};
            colorPicture[] = {1,1,1,1};
            colorText[] = {1,1,1,1};
            text = QUOTE(PATHTOF(ui\body_background.paa));
        };
        class bodyImgHead: bodyImgBackground {
            idc = 50;
            colorBackground[] = {1,1,1,1};
            colorPicture[] = {1,1,1,1};
            colorText[] = {1,1,1,1};
            text = QUOTE(PATHTOF(ui\body_head.paa));
        };
        class bodyImgTorso: bodyImgHead {
            idc = 51;
            text = QUOTE(PATHTOF(ui\body_torso.paa));
        };
        class bodyImgArms_l: bodyImgHead {
            idc = 52;
            text = QUOTE(PATHTOF(ui\body_arm_left.paa));
        };
        class bodyImgArms_r: bodyImgHead {
            idc = 53;
            text = QUOTE(PATHTOF(ui\body_arm_right.paa));
        };
        class bodyImgLegs_l: bodyImgHead {
            idc = 54;
            text = QUOTE(PATHTOF(ui\body_leg_left.paa));
        };
        class bodyImgLegs_r: bodyImgHead {
            idc = 55;
            text = QUOTE(PATHTOF(ui\body_leg_right.paa));
        };
        class InjuryListLabel {
            idc = 199;
            type = CT_STATIC;
            x = "safezoneX + (2 * (((safezoneW / safezoneH) min 1.2) / 40))";
            y = "10.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            w = "9 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            style = 0x00 + 0x100; // ST_LEFT + ST_SHADOW
            font = "RobotoCondensed";
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            text = CSTRING(Injuries);
        };
        class InjuryList: ACE_gui_listBoxBase {
            idc = 200;
            x = "safezoneX + (2 * (((safezoneW / safezoneH) min 1.2) / 40))";
            y = "11 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            w = "9 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            rowHeight = 0.03;
            colorBackground[] = {0, 0, 0, 0.2};
            colorText[] = {1,1, 1, 1.0};
            colorScrollbar[] = {0.95, 0.95, 0.95, 1};
            colorSelect[] = {0.95, 0.95, 0.95, 1};
            colorSelect2[] = {0.95, 0.95, 0.95, 1};
            colorSelectBackground[] = {0, 0, 0, 0.0};
            colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.5};
        };
        class ActivityLog: InjuryList {
            idc = 302;
            y = "21.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            h = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            rowHeight = 0.03;
            shadow = 2;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {1,1, 1, 1.0};
            colorScrollbar[] = {0.95, 0.95, 0.95, 1};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorSelectBackground[] = {0, 0, 0, 0.0};
            colorSelectBackground2[] = {0.0, 0.0, 0.0, 0};
        };
        class TriageStatus {
            idc = 303;
            type = CT_STATIC;
            x = "safezoneX + (2 * (((safezoneW / safezoneH) min 1.2) / 40))";
            y = "20.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            w = "9 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
            style = 0x00 + 0x100; // ST_LEFT + ST_SHADOW
            font = "RobotoCondensed";
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {0,0,0,0.9};
            text = "";
        };
    };
  };
};
