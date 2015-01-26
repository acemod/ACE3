class ACE_gui_RscProgress;
class ACE_gui_staticBase;


class GVAR(ProgressBar_Dialog) {
  idd = -1;
  movingEnable = false;
  onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ctrlProgressBar)),(_this select 0) displayCtrl 1)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ctrlProgressBarTitle)),(_this select 0) displayCtrl 2)];);
  objects[] = {};

  class controlsBackground {
    class Background {
      idc = -1;
      moving = 0;
      font = "TahomaB";
      text = "";
      sizeEx = 0;
      lineSpacing = 0;
      access = 0;
      type = 0;
      style = 0;
      size = 1;
      colorBackground[] = {0, 0, 0, 0.1};
      colorText[] = {0, 0, 0, 0};
      x = "safezoneX";
      y = "safezoneY";
      w = "safezoneW";
      h = "safezoneH";
    };


    class Progress: ACE_gui_RscProgress {
      idc = 1;
      x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
      y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
      w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
      h = "0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
      colorFrame[] = {0,0,0,0};
      colorBar[] = {0.27,0.5,0.31,0.6};
      // colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
      texture = "#(argb,8,8,3)color(1,1,1,0.7)";
    };

    class Title_Bar : ACE_gui_staticBase {
      idc = 2;
      //type = 13;
      //size = 1;
      colorBackground[] = {0, 0, 0, 0};
      x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
      y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
      w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
      h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
      class Attributes {
        font = "TahomaB";
        color = "#000000";
        align = "center";
        valign = "middle";
        shadow = false;
        shadowColor = "#ff0000";
        size = "1";
      };
    };
  };
};

class GVAR(DisableMouse_Dialog) {
  idd = -1;
  movingEnable = false;
  onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgDisableMouse)),_this select 0)];);
  objects[] = {};
  class controlsBackground {
    class Background {
      idc = -1;
      moving = 0;
      font = "TahomaB";
      text = "";
      sizeEx = 0;
      lineSpacing = 0;
      access = 0;
      type = 0;
      style = 0;
      size = 1;
      colorBackground[] = {0, 0, 0, 0};//0.5
      colorText[] = {0, 0, 0, 0};
      x = "safezoneX";
      y = "safezoneY";
      w = "safezoneW";
      h = "safezoneH";
    };
  };
};
