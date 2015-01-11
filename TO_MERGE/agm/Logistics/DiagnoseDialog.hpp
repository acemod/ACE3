
class AGM_Rsc_Control_Base;
class AGM_Rsc_Display_Base;

class AGM_Repair_Diagnose_Dialog {
  idd = -1;
  movingEnable = 0;
  onLoad = "uiNamespace setVariable ['AGM_dlgDiagnose', _this select 0];";
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
      colorBackground[] = {0, 0, 0, 0.25};
      colorText[] = {0, 0, 0, 0};
      x = 0;//"safezoneX";
      y = 0;//"safezoneY";
      w = 1;//"safezoneW";
      h = 1;//"safezoneH";
    };

    /*class Progress_Bar {
      idc = 1;
      moving = 0;
      text = "";
      font = "PuristaMedium";
      sizeEx = "1 / 40 / (getResolution select 5)";
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
    };*/

    class LFWheel : Background{//AGM_Rsc_Control_Base {
      idc = 10;
      colorBackground[] = {1, 1, 1, 1};
      x = "5.5 / 16";
      y = "1 / 9";
      w = "0.5 / 16";
      h = "1.5 / 9";
    };
    class LF2Wheel : LFWheel {
      idc = 11;
      y = "3 / 9";
    };
    class LMWheel : LFWheel {
      idc = 12;
      y = "5 / 9";
    };
    class LBWheel : LFWheel {
      idc = 13;
      y = "7 / 9";
    };

    class RFWheel : LFWheel {
      idc = 14;
      x = "10 / 16";
    };
    class RF2Wheel : RFWheel {
      idc = 15;
      y = "3 / 9";
    };
    class RMWheel : RFWheel {
      idc = 16;
      y = "5 / 9";
    };
    class RBWheel : RFWheel {
      idc = 17;
      y = "7 / 9";
    };

    class Body : LFWheel {
      idc = 20;
      x = "7 / 16";
      y = "4 / 9";
      w = "2 / 16";
      h = "1.5 / 9";
    };
    class Engine : Body {
      idc = 21;
      y = "2 / 9";
    };
    class Fuel : Body {
      idc = 22;
      y = "6 / 9";
    };
  };
};
