
#define RIGHT_SIDE    (safezoneW + safezoneX)
#define LEFT_SIDE     safezoneX
#define TOP_SIDE      safeZoneY
#define BOTTOM_SIDE   (safeZoneH + safezoneY)

#define ICON_WIDTH    (1.75 * (((safezoneW / safezoneH) min 1.2) / 40))
#define X_POS_ICONS   RIGHT_SIDE - (1.1 * ICON_WIDTH)
#define Y_POS_ICONS   TOP_SIDE + (2.2 * ICON_WIDTH)
#define DIFFERENCE_ICONS (1.1 * ICON_WIDTH)

class RscTitles {
  class GVAR(iconsDisplay) {
    duration = 1e+011;
    idd = 1111;
    movingenable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(iconsDisplay)), _this select 0)]);
    class controlsBackground {
      class icon_1: ACE_gui_backgroundBase {
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

  class GVAR(RSC_PROGRESSBAR_LOADING) {
    idd = -1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(RSC_PROGRESSBAR_LOADING)), _this select 0)]);
    fadein = 0;
    fadeout = 0;
    duration = 10e10;
    class Controls {
      class background: ACE_gui_backgroundBase {
        idc = -1;
        colorBackground[] = {0,0,0,1};
        colorText[] = {1, 1, 1, 1};
        x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
        y = "29 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
        w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h = "0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        text = "#(argb,8,8,3)color(0,0,0,0.4)";
      };

      class Progress: ACE_gui_RscProgress {
        idc = 6;
        x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
        y = "29 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
        w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h = "0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        colorFrame[] = {0,0,0,0};
        colorBar[] = {0.27,0.5,0.31,0.6};
        texture = "#(argb,8,8,3)color(1,1,1,0.7)";
      };
    };
  };


  class GVAR(RSC_DISPLAY_MESSAGE) {
    duration = 7;
    idd = 86411;
    movingenable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(RSC_DISPLAY_MESSAGE)), _this select 0)]);
    fadein = 0;
    class controlsBackground {
      class header: ACE_gui_staticBase {
        idc = 1;
        type = CT_STATIC;
        x = "safezoneX + (safezoneW / 10)";
        y = "safezoneY + (30 * (safeZoneH / 40))";
        w = "(safeZoneW / 10)";
        h = "(safeZoneH / 40)";
        style = ST_LEFT;
        font = FontCSE;
        SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        colorText[] = {0.85, 0.85, 0.85, 1.0};
        colorBackground[] = {0, 0, 0, 0.9};
        text = "";
      };
      class text: header {
        idc = 2;
        y = "safezoneY + (31 * (safeZoneH / 40))";
        w = "(safeZoneW / 10) * 1.3";
        colorText[] = {0.0, 0.0, 0.0, 1.0};
        colorBackground[] = {1, 1, 1, 0.9};
        text = "";
      };
    };
  };

  class GVAR(RSC_DISPLAY_INFORMATION) {
    duration = 15;
    idd = 86412;
    movingenable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(RSC_DISPLAY_INFORMATION)), _this select 0)]);
    fadein = 0;
    class controlsBackground {
      class header: ACE_gui_staticBase {
        idc = 1;
        type = CT_STATIC;
        x = "safezoneX + (safezoneW / 10)";
        y = "safezoneY + (6 * (safeZoneH / 40))";
        w = "(safeZoneW / 10)";
        h = "(safeZoneH / 40)";
        style = ST_LEFT;
        font = FontCSE;
        SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        colorText[] = {0.85, 0.85, 0.85, 1.0};
        colorBackground[] = {0, 0, 0, 0.9};
        text = "";
      };
      class text: header {
        idc = 2;
        y = "safezoneY + (7.1 * (safeZoneH / 40))";
        w = "(safeZoneW / 10) * 1.3";
        colorText[] = {0.0, 0.0, 0.0, 1.0};
        colorBackground[] = {1, 1, 1, 0.9};
        text = "";
      };
      class text2: text {
        idc = 3;
        y = "safezoneY + (8.2 * (safeZoneH / 40))";
      };
      class text3: text {
        idc = 4;
        y = "safezoneY + (9.3 * (safeZoneH / 40))";
      };
      class text4: text {
        idc = 5;
        y = "safezoneY + (10.4 * (safeZoneH / 40))";
      };
      class text5: text {
        idc = 6;
        y = "safezoneY + (11.5 * (safeZoneH / 40))";
      };


      class icon: ACE_gui_backgroundBase {
        type = CT_STATIC;
        idc = 10;
        style = ST_PICTURE;
        colorBackground[] = {0,0,0,1};
        colorText[] = {1, 1, 1, 1};
        font = FontCSE;
        text = "";
        sizeEx = 0.032;
        x = "safezoneX + (safezoneW / 10)";
        y = "safezoneY + (4 * (safeZoneH / 40))";
        w = "(safeZoneH / 40)*2";
        h = "(safeZoneH / 40)*2";
      };
    };
  };

};