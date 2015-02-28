class ACE_gui_backgroundBase;

class Rsctitles {
  class GVAR(DisplayInformation) {
  duration = 10e10;
  idd = 1111;
  movingenable = 0;
  onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QUOTE(GVAR(DisplayInformation))), _this select 0)]);

    class controlsBackground {
        class bodyImgBackground: ACE_gui_backgroundBase {
            idc = -1;
            x = "safezoneX + (2 * (((safezoneW / safezoneH) min 1.2) / 40))";
            y = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            w = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "8.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
            colorBackground[] = {1,1,1,1};
            colorPicture[] = {1,1,1,1};
            colorText[] = {1,1,1,1};
            text = QUOTE(PATHTOF(data\body_background.paa));
        };
        class bodyImgHead: bodyImgBackground {
            idc = 50;
            colorBackground[] = {1,1,1,1};
            colorPicture[] = {1,1,1,1};
            colorText[] = {1,1,1,1};
            text = QUOTE(PATHTOF(data\body_head.paa));
        };
        class bodyImgTorso: bodyImgHead {
            idc = 51;
            text = QUOTE(PATHTOF(data\body_torso.paa));
        };
        class bodyImgArms_l: bodyImgHead {
            idc = 52;
            text = QUOTE(PATHTOF(data\body_arm_left.paa));
        };
        class bodyImgArms_r: bodyImgHead {
            idc = 53;
            text = QUOTE(PATHTOF(data\body_arm_right.paa));
        };
        class bodyImgLegs_l: bodyImgHead {
            idc = 54;
            text = QUOTE(PATHTOF(data\body_leg_left.paa));
        };
        class bodyImgLegs_r: bodyImgHead {
            idc = 55;
            text = QUOTE(PATHTOF(data\body_leg_right.paa));
        };
    };
  };
};
