
class AGM_Core_ProgressBar_Dialog {
  idd = -1;
  movingEnable = false;
  onLoad = "uiNamespace setVariable ['AGM_Core_ctrlProgressBar', (_this select 0) displayCtrl 1]; uiNamespace setVariable ['AGM_Core_ctrlProgressBarTitle', (_this select 0) displayCtrl 2];";
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

    class Progress_Bar {
      idc = 1;
      moving = 0;
      text = "";
      font = "PuristaMedium";
      sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      lineSpacing = 0;
      access = 0;
      type = 0;
      style = 2;
      size = 1;
      colorBackground[] = {1, 0.647, 0, 0.5};
      colorText[] = {1,1,1,1};
      x = "safezoneX + 0.1 * safezoneW";
      y = "safezoneY + 0.2 * safezoneH";
      w = "0.0 * safezoneW";
      h = "0.01 * safezoneH";
    };

    class Title_Bar : Progress_Bar {
      idc = 2;
      //type = 13;
      //size = 1;
      colorBackground[] = {0, 0, 0, 0};
      x = "safezoneX + 0.1 * safezoneW";
      y = "safezoneY + 0.1 * safezoneH";
      w = "0.8 * safezoneW";
      h = "0.05 * safezoneH";
      /*class Attributes {
        font = "TahomaB";
        color = "#000000";
        align = "center";
        valign = "middle";
        shadow = false;
        shadowColor = "#ff0000";
        size = "1";
      };*/
    };
  };
};

class AGM_Core_DisableMouse_Dialog {
  idd = -1;
  movingEnable = false;
  onLoad = "uiNamespace setVariable ['AGM_Core_dlgDisableMouse', _this select 0];";
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
