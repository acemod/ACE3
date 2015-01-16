
#define RIGHT_SIDE    (safezoneW + safezoneX)
#define LEFT_SIDE     safezoneX
#define TOP_SIDE      safeZoneY
#define BOTTOM_SIDE   (safeZoneH + safezoneY)

#define ICON_WIDTH    (1.75 * (((safezoneW / safezoneH) min 1.2) / 40))
#define X_POS_ICONS   RIGHT_SIDE - (1.1 * ICON_WIDTH)
#define Y_POS_ICONS   TOP_SIDE + (2.2 * ICON_WIDTH)
#define DIFFERENCE_ICONS (1.1 * ICON_WIDTH)

class RscTitles {
  class cse_gui_iconsDisplay {
    duration = 1e+011;
    idd = 1111;
    movingenable = 0;
    onLoad = "uiNamespace setVariable ['cse_gui_iconsDisplay', _this select 0];";
    class controlsBackground {
      class icon_1: cse_gui_backgroundBase {
        text = "";
        colorText[] = {0.0,1.0,0.0,0.4};
        idc = 10501;
        x = X_POS_ICONS;
        y = Y_POS_ICONS + (0 * DIFFERENCE_ICONS);
        w = ICON_WIDTH;
        h = ICON_WIDTH;
      };
      class icon_2: icon_1 {
        idc = 10502;
        y = Y_POS_ICONS + (1 * DIFFERENCE_ICONS);
      };
      class icon_3: icon_1 {
        idc = 10503;
        y = Y_POS_ICONS + (2 * DIFFERENCE_ICONS);
      };
      class icon_4: icon_1 {
        idc = 10504;
        y = Y_POS_ICONS + (3 * DIFFERENCE_ICONS);
      };
      class icon_5: icon_1 {
        idc = 10505;
        y = Y_POS_ICONS + (4 * DIFFERENCE_ICONS);
      }; 
      class icon_6: icon_1 {
        idc = 10506;
        y = Y_POS_ICONS + (5 * DIFFERENCE_ICONS);
      };
    };
  };
};