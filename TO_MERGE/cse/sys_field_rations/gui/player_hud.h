
#define RIGHT_SIDE    (safezoneW + safezoneX)
#define LEFT_SIDE     safezoneX
#define TOP_SIDE      safeZoneY
#define BOTTOM_SIDE   (safeZoneH + safezoneY)

#define ICON_WIDTH    (1.75 * (((safezoneW / safezoneH) min 1.2) / 40))
#define X_POS_ICONS   RIGHT_SIDE - (1.1 * ICON_WIDTH)
#define Y_POS_ICONS   BOTTOM_SIDE - (0.1 * ICON_WIDTH)
#define DIFFERENCE_ICONS (1.1 * ICON_WIDTH)

class RscTitles {
  class CSE_sys_field_rations_PlayerStatusUI {
    duration = 1e+011;
    idd = 1111;
    movingenable = 0;
    onLoad = "uiNamespace setVariable ['CSE_sys_field_rations_PlayerStatusUI', _this select 0];";
    class controlsBackground {
      class FoodStatus: cse_gui_backgroundBase {
        text = "cse\cse_sys_field_rations\data\hud_foodstatus.paa";
        colorText[] = {0.0,1.0,0.0,0.4};
        idc = 11112;
        x = X_POS_ICONS;
        y = Y_POS_ICONS;
        w = ICON_WIDTH;
        h = ICON_WIDTH;
      };
      class drinkStatus: cse_gui_backgroundBase {
        text = "cse\cse_sys_field_rations\data\icons\icon_drinking.paa";
        colorText[] = {0.0,1.0,0.0,0.4};
        idc = 11113;
        x = X_POS_ICONS;
        y = Y_POS_ICONS - DIFFERENCE_ICONS;
        w = ICON_WIDTH;
        h = ICON_WIDTH;
      };
     /* class CamelBak: cse_gui_backgroundBase {
        text = "cse\cse_sys_field_rations\data\hud_camelbak.paa";
        colorText[] = {0.0,1.0,0.0,0};
        idc = 11114;
        x = "0.955313 * safezoneW + safezoneX";
        y = "0.80 * safezoneH + safezoneY";
        w = 0.05;
        h = 0.09;
      };*/
    };
  };
};