
#define HSPACE 0.3
#define VSPACE 0.3
#define BORDER 0.1

class AGM_Core_Interactive_Button_Base {
  tooltip = "";
  action = "";

  idc = -1;
  access = 0;
  style = 0;
  type = 1;
  text = "";
  font = "PuristaMedium";
  sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
  shadow = 2;

  x = 0;
  y = 0;
  w = 0;
  h = 0;

  offsetX = 0.003;
  offsetY = 0.003;
  offsetPressedX = 0.002;
  offsetPressedY = 0.002;
  borderSize = 0;

  colorText[] = {1,1,1,1};
  colorDisabled[] = {0.5,0.5,0.5,1};
  colorBackground[] = {0,0,0,0.8};
  colorBackgroundDisabled[] = {0,0,0,0.8};
  colorBackgroundActive[] = {1,1,1,0.8};
  colorFocused[] = {0,0,0,0};
  colorShadow[] = {0,0,0,0};
  colorBorder[] = {1,1,1,0.8};

  soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};

#define HSPACE2 0.05
#define VSPACE2 0.05
#define BORDER 0.1

class AGM_Core_Text_Button_Base {
  idc = 2;
  moving = 0;
  text = "";
  font = "PuristaMedium";
  sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
  lineSpacing = 0;
  access = 0;
  type = 0;
  style = 2 + 0x800;
  size = 1;
  colorBackground[] = {0,0,0,0.8};
  colorText[] = {1,1,1,1};
  x = 0;
  y = 0;
  w = 0;
  h = 0;
};

class AGM_Core_OptionsMenu_Dialog {
  idd = -1;
  movingEnable = true;
  onLoad = "_dlgMenuDialog = _this select 0; for '_a' from 20 to 32 do {(_dlgMenuDialog displayCtrl _a) ctrlShow false}; for '_a' from 100 to 119 do {(_dlgMenuDialog displayCtrl _a) ctrlShow false}; for '_a' from 200 to 219 do {(_dlgMenuDialog displayCtrl _a) ctrlShow false}; for '_a' from 300 to 319 do {(_dlgMenuDialog displayCtrl _a) ctrlShow false}; for '_a' from 400 to 419 do {(_dlgMenuDialog displayCtrl _a) ctrlShow false}; for '_a' from 500 to 519 do {(_dlgMenuDialog displayCtrl _a) ctrlShow false}; uiNamespace setVariable ['AGM_Core_MenuDialog', _dlgMenuDialog];";
  objects[] = {};

  class controlsBackground {
    class Background {
      idc = 1;
      moving = 0;
      font = "TahomaB";
      text = "";
      sizeEx = 0;
      lineSpacing = 0;
      access = 0;
      type = 0;
      style = 0 + 0x800;
      size = 1;
      //colorBackground[] = {0, 0.265, 0, 0.5};
      colorBackground[] = {0, 0, 0, 0.5};
      colorText[] = {0, 0, 0, 0};
      x = HSPACE2 / 2 * safezoneW + safezoneX;
      y = VSPACE2 / 2 * safezoneH + safezoneY;
      w = (1 - 2 * HSPACE2 / 2) * safezoneW;
      h = (1 - 2 * VSPACE2 / 2) * safezoneH;
    };

    class Header {
      idc = 2;
      moving = 0;
      text = "$STR_AGM_Core_Options";
      font = "PuristaMedium";
      sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      lineSpacing = 0;
      access = 0;
      type = 0;
      style = 1 + 0x800;
      size = 1;
      //colorBackground[] = {0,0,0,0};
      colorBackground[] = {1, 0.647, 0, 0.5};
      colorText[] = {1,1,1,1};
      x = (HSPACE2 + 0 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 0.5 * 0.04) * safezoneH + safezoneY;
      w = 4.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class AGM_Logo : AGM_Core_Interactive_Button_Base {
      action = "closeDialog 0;";
      type = 0;
      style = 48;
      onMouseEnter = "hint ('_' + str(_this))";
      tooltip = "";
      text = "";//"\AGM_common\rsc\bwlogo.paa";
      idc = 2;
      x = ((1 - 2 * HSPACE2 / 2) - (HSPACE2 + 0.5 * 0.1)) * safezoneW + safezoneX;
      y = (VSPACE2 + 2 * 0.04) * safezoneH + safezoneY;
      w = 1.0 / 16 * safezoneW;
      h = 1.0 / 9 * safezoneH;
    };
  };

  class controls {
    class Text_Button0 : AGM_Core_Text_Button_Base {
      idc = 100;
      style = 0 + 0x800;
      x = (HSPACE2 + 0 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 2 * 0.04) * safezoneH + safezoneY;
      w = 4.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Text_Button1 : Text_Button0 {
      idc = 101;
      y = (VSPACE2 + 3 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button2 : Text_Button0 {
      idc = 102;
      y = (VSPACE2 + 4 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button3 : Text_Button0 {
      idc = 103;
      y = (VSPACE2 + 5 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button4 : Text_Button0 {
      idc = 104;
      y = (VSPACE2 + 6 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button5 : Text_Button0 {
      idc = 105;
      y = (VSPACE2 + 7 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button6 : Text_Button0 {
      idc = 106;
      y = (VSPACE2 + 8 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button7 : Text_Button0 {
      idc = 107;
      y = (VSPACE2 + 9 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button8 : Text_Button0 {
      idc = 108;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button9 : Text_Button0 {
      idc = 109;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button10 : Text_Button0 {
      idc = 110;
      y = (VSPACE2 + 12 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button11 : Text_Button0 {
      idc = 111;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button12 : Text_Button0 {
      idc = 112;
      y = (VSPACE2 + 14 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button13 : Text_Button0 {
      idc = 113;
      y = (VSPACE2 + 15 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button14 : Text_Button0 {
      idc = 114;
      y = (VSPACE2 + 16 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button15 : Text_Button0 {
      idc = 115;
      y = (VSPACE2 + 17 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button16 : Text_Button0 {
      idc = 116;
      y = (VSPACE2 + 18 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button17 : Text_Button0 {
      idc = 117;
      y = (VSPACE2 + 19 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button18 : Text_Button0 {
      idc = 118;
      y = (VSPACE2 + 20 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Button19 : Text_Button0 {
      idc = 119;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
    };

    //////////////////////////////////////////////////

    class Interactive_Button0 : AGM_Core_Interactive_Button_Base {
      action = "AGM_Core_keySet = -1; [0] spawn AGM_Core_editKey";
      sizeEx = "0.8 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      idc = 200;
      style = 2 + 0x800;
      x = (HSPACE2 + 3 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 2 * 0.04) * safezoneH + safezoneY;
      w = 3.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_Button1 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [1] spawn AGM_Core_editKey";
      idc = 201;
      y = (VSPACE2 + 3 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button2 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [2] spawn AGM_Core_editKey";
      idc = 202;
      y = (VSPACE2 + 4 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button3 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [3] spawn AGM_Core_editKey";
      idc = 203;
      y = (VSPACE2 + 5 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button4 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [4] spawn AGM_Core_editKey";
      idc = 204;
      y = (VSPACE2 + 6 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button5 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [5] spawn AGM_Core_editKey";
      idc = 205;
      y = (VSPACE2 + 7 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button6 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [6] spawn AGM_Core_editKey";
      idc = 206;
      y = (VSPACE2 + 8 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button7 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [7] spawn AGM_Core_editKey";
      idc = 207;
      y = (VSPACE2 + 9 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button8 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [8] spawn AGM_Core_editKey";
      idc = 208;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button9 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [9] spawn AGM_Core_editKey";
      idc = 209;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button10 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [10] spawn AGM_Core_editKey";
      idc = 210;
      y = (VSPACE2 + 12 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button11 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [11] spawn AGM_Core_editKey";
      idc = 211;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button12 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [12] spawn AGM_Core_editKey";
      idc = 212;
      y = (VSPACE2 + 14 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button13 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [13] spawn AGM_Core_editKey";
      idc = 213;
      y = (VSPACE2 + 15 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button14 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [14] spawn AGM_Core_editKey";
      idc = 214;
      y = (VSPACE2 + 16 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button15 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [15] spawn AGM_Core_editKey";
      idc = 215;
      y = (VSPACE2 + 17 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button16 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [16] spawn AGM_Core_editKey";
      idc = 216;
      y = (VSPACE2 + 18 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button17 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [17] spawn AGM_Core_editKey";
      idc = 217;
      y = (VSPACE2 + 19 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button18 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [18] spawn AGM_Core_editKey";
      idc = 218;
      y = (VSPACE2 + 20 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Button19 : Interactive_Button0 {
      action = "AGM_Core_keySet = -1; [19] spawn AGM_Core_editKey";
      idc = 219;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
    };

    //////////////////////////////////////////////////

    class Interactive_Checkbox0 : Text_Button0 {
      action = "hint '0'";
      idc = 300;
      //type = 0;
      style = 48;
      text = "\AGM_Core\UI\box_unchecked_ca.paa";
      colorBackground[] = {0, 0, 0, 0};
      colorText[] = {1, 1, 1, 1};
      x = (HSPACE2 + 3 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 2 * 0.04) * safezoneH + safezoneY;
      w = 0.3 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_Checkbox1 : Interactive_Checkbox0 {
      action = "";
      idc = 301;
      y = (VSPACE2 + 3 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox2 : Interactive_Checkbox0 {
      action = "";
      idc = 302;
      y = (VSPACE2 + 4 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox3 : Interactive_Checkbox0 {
      action = "";
      idc = 303;
      y = (VSPACE2 + 5 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox4 : Interactive_Checkbox0 {
      action = "";
      idc = 304;
      y = (VSPACE2 + 6 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox5 : Interactive_Checkbox0 {
      action = "";
      idc = 305;
      y = (VSPACE2 + 7 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox6 : Interactive_Checkbox0 {
      action = "";
      idc = 306;
      y = (VSPACE2 + 8 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox7 : Interactive_Checkbox0 {
      action = "";
      idc = 307;
      y = (VSPACE2 + 9 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox8 : Interactive_Checkbox0 {
      action = "";
      idc = 308;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox9 : Interactive_Checkbox0 {
      action = "";
      idc = 309;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox10 : Interactive_Checkbox0 {
      action = "";
      idc = 310;
      y = (VSPACE2 + 12 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox11 : Interactive_Checkbox0 {
      action = "";
      idc = 311;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox12 : Interactive_Checkbox0 {
      action = "";
      idc = 312;
      y = (VSPACE2 + 14 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox13 : Interactive_Checkbox0 {
      action = "";
      idc = 313;
      y = (VSPACE2 + 15 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox14 : Interactive_Checkbox0 {
      action = "";
      idc = 314;
      y = (VSPACE2 + 16 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox15 : Interactive_Checkbox0 {
      action = "";
      idc = 315;
      y = (VSPACE2 + 17 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox16 : Interactive_Checkbox0 {
      action = "";
      idc = 316;
      y = (VSPACE2 + 18 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox17 : Interactive_Checkbox0 {
      action = "";
      idc = 317;
      y = (VSPACE2 + 19 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox18 : Interactive_Checkbox0 {
      action = "";
      idc = 318;
      y = (VSPACE2 + 20 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_Checkbox19 : Interactive_Checkbox0 {
      action = "";
      idc = 319;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
    };

    //////////////////////////////////////////////////

    class Text_Checkbox0 : Text_Button0 {
      idc = 400;
      x = (HSPACE2 + 0 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 2 * 0.04) * safezoneH + safezoneY;
      w = 4.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Text_Checkbox1 : Text_Checkbox0 {
      idc = 401;
      y = (VSPACE2 + 3 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox2 : Text_Checkbox0 {
      idc = 402;
      y = (VSPACE2 + 4 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox3 : Text_Checkbox0 {
      idc = 403;
      y = (VSPACE2 + 5 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox4 : Text_Checkbox0 {
      idc = 404;
      y = (VSPACE2 + 6 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox5 : Text_Checkbox0 {
      idc = 405;
      y = (VSPACE2 + 7 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox6 : Text_Checkbox0 {
      idc = 406;
      y = (VSPACE2 + 8 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox7 : Text_Checkbox0 {
      idc = 407;
      y = (VSPACE2 + 9 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox8 : Text_Checkbox0 {
      idc = 408;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox9 : Text_Checkbox0 {
      idc = 409;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox10 : Text_Checkbox0 {
      idc = 410;
      y = (VSPACE2 + 12 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox11 : Text_Checkbox0 {
      idc = 411;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox12 : Text_Checkbox0 {
      idc = 412;
      y = (VSPACE2 + 14 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox13 : Text_Checkbox0 {
      idc = 413;
      y = (VSPACE2 + 15 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox14 : Text_Checkbox0 {
      idc = 414;
      y = (VSPACE2 + 16 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox15 : Text_Checkbox0 {
      idc = 415;
      y = (VSPACE2 + 17 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox16 : Text_Checkbox0 {
      idc = 416;
      y = (VSPACE2 + 18 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox17 : Text_Checkbox0 {
      idc = 417;
      y = (VSPACE2 + 19 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox18 : Text_Checkbox0 {
      idc = 418;
      y = (VSPACE2 + 20 * 0.04) * safezoneH + safezoneY;
    };

    class Text_Checkbox19 : Text_Checkbox0 {
      idc = 419;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
    };

    //////////////////////////////////////////////////

    class Interactive_CheckboxButton0 : AGM_Core_Interactive_Button_Base {
      action = "[0] call AGM_Core_toggleState";
      idc = 500;
      colorBackground[] = {0, 0, 0, 0};
      colorBackgroundActive[] = {0, 0, 0, 0};
      colorText[] = {1, 1, 1, 1};
      x = (HSPACE2 + 3 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 2 * 0.04) * safezoneH + safezoneY;
      w = 0.3 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_CheckboxButton1 : Interactive_CheckboxButton0 {
      action = "[1] call AGM_Core_toggleState";
      idc = 501;
      y = (VSPACE2 + 3 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton2 : Interactive_CheckboxButton0 {
      action = "[2] call AGM_Core_toggleState";
      idc = 502;
      y = (VSPACE2 + 4 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton3 : Interactive_CheckboxButton0 {
      action = "[3] call AGM_Core_toggleState";
      idc = 503;
      y = (VSPACE2 + 5 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton4 : Interactive_CheckboxButton0 {
      action = "[4] call AGM_Core_toggleState";
      idc = 504;
      y = (VSPACE2 + 6 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton5 : Interactive_CheckboxButton0 {
      action = "[5] call AGM_Core_toggleState";
      idc = 505;
      y = (VSPACE2 + 7 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton6 : Interactive_CheckboxButton0 {
      action = "[6] call AGM_Core_toggleState";
      idc = 506;
      y = (VSPACE2 + 8 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton7 : Interactive_CheckboxButton0 {
      action = "[7] call AGM_Core_toggleState";
      idc = 507;
      y = (VSPACE2 + 9 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton8 : Interactive_CheckboxButton0 {
      action = "[8] call AGM_Core_toggleState";
      idc = 508;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton9 : Interactive_CheckboxButton0 {
      action = "[9] call AGM_Core_toggleState";
      idc = 509;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton10 : Interactive_CheckboxButton0 {
      action = "[10] call AGM_Core_toggleState";
      idc = 510;
      y = (VSPACE2 + 12 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton11 : Interactive_CheckboxButton0 {
      action = "[11] call AGM_Core_toggleState";
      idc = 511;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton12 : Interactive_CheckboxButton0 {
      action = "[12] call AGM_Core_toggleState";
      idc = 512;
      y = (VSPACE2 + 14 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton13 : Interactive_CheckboxButton0 {
      action = "[13] call AGM_Core_toggleState";
      idc = 513;
      y = (VSPACE2 + 15 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton14 : Interactive_CheckboxButton0 {
      action = "[14] call AGM_Core_toggleState";
      idc = 514;
      y = (VSPACE2 + 16 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton15 : Interactive_CheckboxButton0 {
      action = "[15] call AGM_Core_toggleState";
      idc = 515;
      y = (VSPACE2 + 17 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton16 : Interactive_CheckboxButton0 {
      action = "[16] call AGM_Core_toggleState";
      idc = 516;
      y = (VSPACE2 + 18 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton17 : Interactive_CheckboxButton0 {
      action = "[17] call AGM_Core_toggleState";
      idc = 517;
      y = (VSPACE2 + 19 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton18 : Interactive_CheckboxButton0 {
      action = "[18] call AGM_Core_toggleState";
      idc = 518;
      y = (VSPACE2 + 20 * 0.04) * safezoneH + safezoneY;
    };

    class Interactive_CheckboxButton19 : Interactive_CheckboxButton0 {
      action = "[19] call AGM_Core_toggleState";
      idc = 519;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
    };

    //////////////////////////////////////////////////

    class TextBox_KeyChange : Text_Button0 {
      text = "";
      idc = 20;
      style = 2 + 0x800;
      x = (6 * 0.1) * safezoneW + safezoneX;
      y = (8 * 0.04) * safezoneH + safezoneY;
      w = (6.0 / 16 - HSPACE2 / 2) * safezoneW;
      h = (3.0 / 9 - VSPACE2 / 2) * safezoneH;
    };

    /*class TextBox_Key_Shift : TextBox_KeyChange {
      text = "$STR_AGM_Core_Shift";
      idc = 21;
      colorText[] = {0.25,0.25,0.25,1};
      colorBackground[] = {0,0,0,0};
      x = (3 / 4 * HSPACE2 + 5.75 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
      w = 2.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class TextBox_Key_Control : TextBox_Key_Shift {
      text = "$STR_AGM_Core_Ctrl";
      idc = 22;
      x = (3 / 4 * HSPACE2 + 6.75 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key_Alt : TextBox_Key_Shift {
      text = "$STR_AGM_Core_Alt";
      idc = 23;
      x = (3 / 4 * HSPACE2 + 7.75 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };*/

    class TextBox_Key_Shift : Interactive_Button0 {
      action = "AGM_Core_keyNewTemp = [42, [false, false, false], 42];";
      text = "$STR_AGM_Core_Shift";
      sizeEx = "0.7 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      idc = 21;
      colorText[] = {1,1,1,1};
      colorBackground[] = {0,0,0,0};
      x = (3 / 4 * HSPACE2 + 6 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
      w = 1.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class TextBox_Key_Control : TextBox_Key_Shift {
      action = "AGM_Core_keyNewTemp = [29, [false, false, false], 29];";
      text = "$STR_AGM_Core_Ctrl";
      idc = 22;
      x = (3 / 4 * HSPACE2 + 6.75 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key_Alt : TextBox_Key_Shift {
      action = "AGM_Core_keyNewTemp = [56, [false, false, false], 56];";
      text = "$STR_AGM_Core_Alt";
      idc = 23;
      x = (3 / 4 * HSPACE2 + 7.5 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key_Shift_Right : TextBox_Key_Shift {
      action = "AGM_Core_keyNewTemp = [54, [false, false, false], 54];";
      text = "$STR_AGM_Core_Shift_Right";
      idc = 27;
      x = (3 / 4 * HSPACE2 + 6 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key_Control_Right : TextBox_Key_Shift {
      action = "AGM_Core_keyNewTemp = [157, [false, false, false], 157];";
      text = "$STR_AGM_Core_Ctrl_Right";
      idc = 28;
      x = (3 / 4 * HSPACE2 + 6.75 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key_Alt_Right : TextBox_Key_Shift {
      action = "AGM_Core_keyNewTemp = [184, [false, false, false], 184];";
      text = "$STR_AGM_Core_Alt_Right";
      idc = 29;
      x = (3 / 4 * HSPACE2 + 7.5 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Action : TextBox_KeyChange {
      text = "";
      idc = 30;
      colorText[] = {1,1,1,1};
      colorBackground[] = {0,0,0,0};
      sizeEx = "0.8 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      x = (3 / 4 * HSPACE2 + 6.75 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 7 * 0.04) * safezoneH + safezoneY;
      w = 2.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class TextBox_Key_Default : TextBox_Key_Shift {
      action = "call AGM_Core_keysetDefault";
      text = "$STR_AGM_Core_KeyDefault";
      idc = 31;
      x = (3 / 4 * HSPACE2 + 8.25 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 10 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key_None : TextBox_Key_Shift {
      action = "AGM_Core_keyNewTemp = [0, [false, false, false], 0];";
      text = "$STR_AGM_Core_KeyNone";
      idc = 32;
      x = (3 / 4 * HSPACE2 + 8.25 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 11 * 0.04) * safezoneH + safezoneY;
    };

    class TextBox_Key : TextBox_KeyChange {
      text = "";
      idc = 24;
      colorText[] = {1,1,1,1};
      colorBackground[] = {0,0,0,0};
      sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      x = (3 / 4 * HSPACE2 + 6.75 * 0.1 - 2.0 / 16) * safezoneW + safezoneX;
      y = (VSPACE2 + 8.5 * 0.04) * safezoneH + safezoneY;
      w = 6.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_ButtonV : Interactive_Button0 {
      action = "AGM_Core_keySet = 1";
      text = "$STR_AGM_Core_Save";
      sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      idc = 25;
      colorBackground[] = {0,0,0,0};
      x = (HSPACE2 + 6 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
      w = 2.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_ButtonW : Interactive_ButtonV {
      action = "AGM_Core_keySet = -1";
      text = "$STR_AGM_Core_Cancel";
      idc = 26;
      x = (HSPACE2 + 7.5 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 13 * 0.04) * safezoneH + safezoneY;
      w = 2.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_ButtonX : Interactive_Button0 {
      action = "AGM_Core_keySave = 1; closeDialog 0";
      text = "$STR_AGM_Core_Save";
      sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      idc = 10;
      x = ((1 - 2 * HSPACE2 / 2) - (HSPACE2 + 2.5 * 0.1)) * safezoneW + safezoneX;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
      w = 2.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_ButtonY : Interactive_Button0 {
      action = "AGM_Core_keySave = -1; closeDialog 0";
      text = "$STR_AGM_Core_Cancel";
      sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
      idc = 11;
      x = ((1 - 2 * HSPACE2 / 2) - (HSPACE2 + 1 * 0.1)) * safezoneW + safezoneX;
      y = (VSPACE2 + 21 * 0.04) * safezoneH + safezoneY;
      w = 2.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_ButtonA : AGM_Core_Interactive_Button_Base {
      action = "false call AGM_Core_nextKeys";
      text = "$STR_AGM_Core_Prev";
      idc = 12;
      style = 2 + 0x800;
      x = (HSPACE2 + 3 * 0.1) * safezoneW + safezoneX;
      y = (VSPACE2 + 0.5 * 0.04) * safezoneH + safezoneY;
      w = 1.0 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };

    class Interactive_ButtonB : Interactive_ButtonA {
      action = "true call AGM_Core_nextKeys";
      text = "$STR_AGM_Core_Next";
      idc = 13;
      x = (HSPACE2 + 3 * 0.1 + 2.0 / 16) * safezoneW + safezoneX;
    };

    class Interactive_ButtonC : AGM_Core_Text_Button_Base {
      text = "";
      idc = 14;
      style = 2 + 0x800;
      x = (HSPACE2 + 3 * 0.1 + 1.25 / 16) * safezoneW + safezoneX;
      y = (VSPACE2 + 0.5 * 0.04) * safezoneH + safezoneY;
      w = 0.5 / 16 * safezoneW;
      h = 0.3 / 9 * safezoneH;
    };
  };
};
