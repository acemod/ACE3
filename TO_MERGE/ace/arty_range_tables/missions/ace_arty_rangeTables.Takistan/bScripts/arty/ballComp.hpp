#include "defines.inc"

#define COLOR_DARK {0.2, 0.26, 0.2, 0.7}
#define COLOR_NOCOLOR  {0, 0, 0, 0}
#define COLOR_BLACK  {0, 0, 0, 1}

#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_LIST 			5 

#define ST_LEFT 0x00

class bArty_rscList {
	type = CT_LIST;
	style = ST_LEFT;
	font = "BitStream";
	sizeEx = 0.025;
	color[] = {1,1,1,1 };
	colorText[] = {0.543000,0.574200,0.410200,1.000000 };
	colorScrollbar[] = {0,1,0,1 };
	colorSelect[] = {0.950000,0.950000,0.950000,1 };
	colorSelect2[] = {0.950000,0.950000,0.950000,1 };
	colorSelectBackground[] = {0,0,0,1 };
	colorSelectBackground2[] = {0.543000,0.574200,0.410200,1.000000 };
	period = 1.200000;
	colorBackground[] = {0,0,0,1 };
	maxHistoryDelay = 1.000000;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	
	class ScrollBar  {
		color[] = {0,1,0,1 };
		colorActive[] = {1,1,1,1 };
		colorDisabled[] = {1,1,1,0.300000 };
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class bArty_rscText {
  access = 0;
  idc = -1;
  type = CT_STATIC;
  style = ST_LEFT;
  w = 0.1;
  h = 0.05;
  font = Zeppelin32;
  sizeEx = 0.023;
  colorBackground[] = COLOR_NOCOLOR;
  colorText[] = COLOR_BLACK;
  text = "";

};

class bArty_RscEdit {
  type = CT_EDIT;
  idc = -1;
  style = ST_LEFT;
  x = 0;
  y = 0;
  w = 0.2;
  h = 0.4;
  font = "TahomaB";
  sizeEx = 0.02;
  colorText[] = {0, 0, 0, 1};
  colorSelection[] = {0.5, 0.5, 0.5, 1};
  autocomplete = false;
  text = "";
};

class bArty_rscButton {
  access = 0;
  type = CT_BUTTON;
  style = ST_LEFT;
  x = 0; y = 0;
  w = 0.3; h = 0.1;

  // text properties
  text = "";
  font = Zeppelin32;
  sizeEx = 0.024;
  colorText[] = {0.95, 0.95, 0.95, 1};
  colorDisabled[] = {0.4, 0.4, 0.4, 1};
  colorBackground[] = {1, 0.537, 0, 0.5};
  colorBackgroundActive[] = {1, 0.537, 0, 1};
  colorBackgroundDisabled[] = {0.58, 0.1147, 0.1108, 1};
  offsetX = 0.003;
  offsetY = 0.003;
  offsetPressedX = 0.002;
  offsetPressedY = 0.002;
  colorFocused[] = {1, 0.537, 0, 1};
  colorShadow[] = {0.023529, 0, 0.0313725, 1};
  colorBorder[] = {0.023529, 0, 0.0313725, 1};
  borderSize = 0.008; // when negative, the border is on the right side of background

  // sounds
  soundEnter[] = {"", 0.1, 1};
  soundPush[] = {"", 0.1, 1};
  soundClick[] = {"", 0.1, 1};
  soundEscape[] = {"", 0.1, 1};
};

class bArty_ballCompRsc {
  idd = BALLCOMP_IDD;
  movingEnable = 1;
  fadein = 0.0;
  fadeout = 0.0;
  duration = 1e6;
  access = 0;
  onLoad = "_this spawn ballCompCtrl;";

  class objects {
  };

  class controlsBackground {
    class Background {
      idc = -1;   // set to -1, unneeded
      type = CT_STATIC;   // constant
      style = ST_LEFT;   // constant
      text = "";
      font = "TahomaB";
      sizeEx = 0.023;

      colorBackground[] = COLOR_DARK;
      colorText[] = { 0, 0, 0, 1 };

      x = 0.05;
      y = 0.05;
      w = 0.9;
      h = 0.9;
    };
  };

  class controls {

    class titleText : bArty_rscText {
      idc = -1;
      x = 0.2;
      y = 0.1;
      w = 0.6;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      colorText[] = { 1, 1, 1, 1 };
      style = ST_CENTER;
      sizeEx = 0.05;
      text = "Ballistic Computer";
    };

    class TgtEastingText : bArty_rscText {
      idc = -1;
      x = 0.1;
      y = 0.3;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Target Easting:";
      sizeEx = 0.03;
    };

    class BoxTgtEasting : bArty_RscEdit {
      idc = TGTEASTING_IDC;
      text = "";
      x = 0.25;
      y = 0.3;
      w = 0.1;
      h = 0.05;
      colorText[] = {1, 1, 1, 1};
    };

    class TgtNorthingText : bArty_rscText {
      idc = -1;
      x = 0.1;
      y = 0.4;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Target Northing:";
      sizeEx = 0.03;
    };

    class BoxTgtNorthing : bArty_RscEdit {
      idc = TGTNORTHING_IDC;
      text = "";
      x = 0.25;
      y = 0.4;
      w = 0.1;
      h = 0.05;
      colorText[] = {1, 1, 1, 1};
    };
	
	class TgtElevationText : bArty_rscText {
      idc = -1;
      x = 0.1;
      y = 0.5;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Target Elevation:";
      sizeEx = 0.03;
    };

    class BoxTgtElevation : bArty_RscEdit {
      idc = TGTELEV_IDC;
      text = "";
      x = 0.25;
      y = 0.5;
      w = 0.1;
      h = 0.05;
      colorText[] = {1, 1, 1, 1};
    };
	
	class PosEastingText : bArty_rscText {
      idc = -1;
      x = 0.1;
      y = 0.6;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Your Easting:";
      sizeEx = 0.03;
    };

    class BoxPosEasting : bArty_RscEdit {
      idc = POSEASTING_IDC;
      text = "";
      x = 0.25;
      y = 0.6;
      w = 0.1;
      h = 0.05;
      colorText[] = {1, 1, 1, 1};
    };

    class PosNorthingText : bArty_rscText {
      idc = -1;
      x = 0.1;
      y = 0.7;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Your Northing:";
      sizeEx = 0.03;
    };

    class BoxPosNorthing : bArty_RscEdit {
      idc = POSNORTHING_IDC;
      text = "";
      x = 0.25;
      y = 0.7;
      w = 0.1;
      h = 0.05;
      colorText[] = {1, 1, 1, 1};
    };
	
	class PosElevationText : bArty_rscText {
      idc = -1;
      x = 0.1;
      y = 0.8;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Your Elevation:";
      sizeEx = 0.03;
    };

    class BoxPosElevation : bArty_RscEdit {
      idc = POSELEV_IDC;
      text = "";
      x = 0.25;
      y = 0.8;
      w = 0.1;
      h = 0.05;
      colorText[] = {1, 1, 1, 1};
    };
	
	class RoundText : bArty_rscText {
      idc = -1;
      x = 0.4;
      y = 0.2;
      w = 0.15;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "Round:";
      sizeEx = 0.03;
    };

    class ListRound : bArty_rscList {
      idc = ROUND_IDC;
	  x = 0.4;
	  y = 0.3;
	  w = 0.2;
	  h = 0.12;
	  rowHeight = 0.025;
	  wholeHeight = 4 * 0.025; // 3 lines to display + 1 line of the unelapsed control
    };
	
	class ResultElevationText : bArty_rscText {
      idc = ELEV_IDC;
      x = 0.65;
      y = 0.2;
      w = 0.25;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "";
      sizeEx = 0.03;
    };
	
	class ResultAzimuthText : bArty_rscText {
      idc = AZI_IDC;
      x = 0.65;
      y = 0.3;
      w = 0.25;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "";
      sizeEx = 0.03;
    };
	
	class ResultChargeText : bArty_rscText {
      idc = CHARGE_IDC;
      x = 0.65;
      y = 0.4;
      w = 0.25;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "";
      sizeEx = 0.03;
    };
	
	class ResultTOFText : bArty_rscText {
      idc = TOF_IDC;
      x = 0.65;
      y = 0.5;
      w = 0.25;
      h = 0.04;
      colorBackground[] = { 0, 0, 0, 0 };
      style = ST_LEFT;
      text = "";
      sizeEx = 0.03;
    };
	
    class BtnCalc : bArty_rscButton {
      idc = CALC_IDC;
      text = "Calculate Firing Solution";
      x = 0.4;
      y = 0.7;
      w = 0.2;
      action = "id = [vehicle player] execVM 'bScripts\arty\calculate.sqf';";
    };

    class BtnExit : bArty_rscButton {
      idc = -1;
      text = "Exit";
      x = 0.7;
      y = 0.8;
      w = 0.15;
      action = "closeDialog 0;";
    };
  };
};
