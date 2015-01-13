class cse_m_tablet {
	idd = 590823;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_m_tablet', _this select 0]; ['cse_m_tablet', true] call cse_fnc_gui_blurScreen;";
	onUnload = "['cse_m_tablet', false] call cse_fnc_gui_blurScreen;";
	duration = 10e10;
	fadein = 0;
	fadeout = 0;

	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = -0.7;
			y = -0.3;
			w = 2.35;
			h = 1.55;
			text = "cse\cse_sys_cc\data\m_tablet.paa";
		};
	};

	class controls {
		class cse_empty_background : cse_gui_backgroundBase {
			idc = 1;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "cse\cse_sys_cc\data\empty_background2.paa";
		};

		class cse_icon1 : cse_gui_backgroundBase {
			idc = 100;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "";
		};

		class cse_icon2 : cse_icon1 {
			idc = 101;
		};
		class cse_icon3 : cse_icon1 {
			idc = 102;
		};
		class cse_icon4 : cse_icon1 {
			idc = 103;
		};
		class cse_icon5 : cse_icon1 {
			idc = 104;
		};
		class cse_icon6 : cse_icon1 {
			idc = 105;
		};
		class cse_icon7 : cse_icon1 {
			idc = 106;
		};
		class cse_icon8 : cse_icon1 {
			idc = 107;
		};
		class cse_icon9 : cse_icon1 {
			idc = 108;
		};
		class cse_icon10 : cse_icon1 {
			idc = 109;
		};
		class cse_icon11 : cse_icon1 {
			idc = 110;
		};
		class cse_icon12 : cse_icon1 {
			idc = 111;
		};
		class cse_icon13 : cse_icon1 {
			idc = 112;
		};

		class cse_icon_button1 : cse_gui_buttonBase {
			idc = 120;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			color[] = {1.0, 1.0, 1.0, 0};
			color2[] = {1.0, 1.0, 1.0, 0};
			colorBackground[] = {1.0, 1.0, 1.0, 0};
			colorbackground2[] = {1.0, 1.0, 1.0, 0};
			colorDisabled[] = {1.0, 1.0, 1.0, 0};
			text = "";
			animTextureNormal = "";
			animTextureDisabled = "";
			animTextureOver = "";
			animTextureFocused = "";
			animTexturePressed = "";
			animTextureDefault = "";
		};

		class cse_icon_button2 : cse_icon_button1 {
			idc = 121;
		};
		class cse_icon_button3 : cse_icon_button1 {
			idc = 122;
		};
		class cse_icon_button4 : cse_icon_button1 {
			idc = 123;
		};
		class cse_icon_button5 : cse_icon_button1 {
			idc = 124;
		};
		class cse_icon_button6 : cse_icon_button1 {
			idc = 125;
		};
		class cse_icon_button7 : cse_icon_button1 {
			idc = 126;
		};
		class cse_icon_button8 : cse_icon_button1 {
			idc = 127;
		};
		class cse_icon_button9 : cse_icon_button1 {
			idc = 128;
		};
		class cse_icon_button10 : cse_icon_button1 {
			idc = 129;
		};
		class cse_icon_button11 : cse_icon_button1 {
			idc = 130;
		};
		class cse_icon_button12 : cse_icon_button1 {
			idc = 131;
		};
		class cse_icon_button13 : cse_icon_button1 {
			idc = 132;
		};

		class cse_icon_label1 : cse_gui_staticBase {
			idc = 140;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			style = ST_CENTER;
		};
		class cse_icon_label2: cse_icon_label1 {
			idc = 141;
		};
		class cse_icon_label3: cse_icon_label1 {
			idc = 142;
		};
		class cse_icon_label4: cse_icon_label1 {
			idc = 143;
		};
		class cse_icon_label5: cse_icon_label1 {
			idc = 144;
		};
		class cse_icon_label6: cse_icon_label1 {
			idc = 145;
		};



		class mapDisplay1: cse_gui_mapBase {
			idc = 10;
			x = 100;
			y = 100;
			w = 0.3;
			h = 0.3;
			type = 101;
			moveOnEdges = 0;
			showCountourInterval = 1;
		};

		// 150 t/m 165
		class cse_popUpMenuBackground: cse_gui_backgroundBase {
			idc = 150;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			//text = "cse\cse_sys_cc\data\dropdown_menu2.paa";
			type = CT_STATIC;
			style = ST_LEFT + ST_SHADOW;
			text = "";
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class cse_popUpMenuBackgroundheader: cse_popUpMenuBackground {
			idc = 151;
			colorBackground[] = {0.05,0.05,0.05,1};
		};
		class cse_popUpMenuHeaderTitle: cse_gui_staticBase {
			idc = 152;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			style = ST_CENTER;
		};
		class popUpMenuBtn_accept: cse_gui_buttonBase {
			idc = 153;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			style = ST_CENTER;
			/*animTextureNormal = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureDisabled = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureOver = "cse\cse_sys_cc\data\button_dropdown_menu_hover.paa";
			animTextureFocused = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTexturePressed = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureDefault = "cse\cse_sys_cc\data\button_dropdown_menu.paa";*/
			animTextureNormal = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.4,0.4,0.4,1)";
			animTextureOver = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTextureFocused = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTexturePressed = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTextureDefault = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			colorBackground[] = {0.97,0.97,0.97,1};
			colorbackground2[] = {0.97,0.97,0.97,1};
			colorDisabled[] = {0.97,0.97,0.97,1};
			colorFocused[] = {0.97,0.97,0.97,1};
			colorBackgroundFocused[] = {1,1,1,1};
			text = "Accept";
		};
		class popUpMenuBtn_close: popUpMenuBtn_accept {
			idc = 154;
			text = "Close";
		};

		class cse_bottomBar: cse_gui_backgroundBase {
			idc = 155;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			//text = "cse\cse_sys_cc\data\dropdown_menu2.paa";
			type = CT_STATIC;
			style = ST_LEFT + ST_SHADOW;
			text = "";
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};

		class bottomBar_Text: cse_gui_staticBase {
			idc = 156;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			style = ST_LEFT;
			sizeEx = 0.025;
		};

		class cse_sidebar_background : cse_gui_backgroundBase {
			idc = 2;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			//text = "cse\cse_sys_cc\data\dropdown_menu2.paa";
			type = CT_STATIC;
			style = ST_LEFT + ST_SHADOW;
			text ="";
			colorText[] = {0.95, 0.95, 0.95, 1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};


		class mapDisplay2: mapDisplay1 {
			idc = 11;
		};

		class cse_navBar_background : cse_sidebar_background {
			idc = 3;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			//text = "cse\cse_sys_cc\data\dropdown_menu2.paa";
			text = "";
			colorText[] = {0.95, 0.95, 0.95, 0.75};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class cse_toggleSideBar : cse_gui_buttonBase {
			idc = 4;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			color[] = {0.97,0.97,0.97,1};
			color2[] = {0.97,0.97,0.97,1};
			colorBackground[] = {0.97,0.97,0.97,0.7};
			colorbackground2[] = {0.97,0.97,0.97, 0.7};
			colorDisabled[] = {0.97,0.97,0.97, 0.6};
			colorFocused[] = {0.97,0.97,0.97, 1};
  			colorBackgroundFocused[] = {0.97,0.97,0.97, 1};
			text = "";
			animTextureNormal = "cse\cse_sys_cc\data\menuIcon.paa";
			animTextureDisabled = "cse\cse_sys_cc\data\menuIcon.paa";
			animTextureOver = "cse\cse_sys_cc\data\menuIcon.paa";
			animTextureFocused = "cse\cse_sys_cc\data\menuIcon.paa";
			animTexturePressed = "cse\cse_sys_cc\data\menuIcon.paa";
			animTextureDefault = "cse\cse_sys_cc\data\menuIcon.paa";

		};

		class information_label1: cse_gui_staticBase {
			idc = 5;
			style = ST_RIGHT;
			text = "";
			x = 0;
			y = 0;
			w = 0;
			h = 0;
		};

		class cse_homeIconNavBarBtn : cse_gui_buttonBase {
			idc = 198;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			color[] = {1.0, 1.0, 1.0, 1};
			color2[] = {1.0, 1.0, 1.0, 1};
			colorBackground[] = {1.0, 1.0, 1.0, 0.7};
			colorbackground2[] = {1.0, 1.0, 1.0, 0.7};
			colorDisabled[] = {1.0, 1.0, 1.0, 0.6};
			colorFocused[] = {1.0, 1.0, 1.0, 1};
  			colorBackgroundFocused[] = {1.0, 1.0, 1.0, 1};
			text = "";
			animTextureNormal = "cse\cse_sys_cc\data\home_icon.paa";
			animTextureDisabled = "cse\cse_sys_cc\data\home_icon.paa";
			animTextureOver = "cse\cse_sys_cc\data\home_icon.paa";
			animTextureFocused = "cse\cse_sys_cc\data\home_icon.paa";
			animTexturePressed = "cse\cse_sys_cc\data\home_icon.paa";
			animTextureDefault = "cse\cse_sys_cc\data\home_icon.paa";

		};

		class cse_navBarIconHome: cse_icon1 {
			idc = 199;
		};
		class cse_navBarIcon1: cse_navBarIconHome {
			idc = 200;
		};


		class ppDisplay: cse_gui_backgroundBase {
			idc = 20;
			type = 0;
			style = 48;
			text = "";
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0, 0, 0, 0.3};
			font = "TahomaB";
			sizeEx = 0;
			lineSpacing = 0;
			fixedWidth = 0;
			shadow = 0;
		};
		class ppDisplay2: ppDisplay {
			idc = 21;
		};


		class sideBar_label1: cse_gui_staticBase{
			idc = 40;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "hi";
		};
		class sideBar_label2: sideBar_label1{
			idc = 41;
		};
		class sideBar_label3: sideBar_label1{
			idc = 42;
		};
		class sideBar_label4: sideBar_label1{
			idc = 43;
		};
		class sideBar_label5: sideBar_label1{
			idc = 44;
		};
		class sideBar_label6: sideBar_label1{
			idc = 45;
		};
		class sideBar_label7: sideBar_label1{
			idc = 46;
		};
		class sideBar_label8: sideBar_label1{
			idc = 47;
		};
		class sideBar_label9: sideBar_label1{
			idc = 48;
		};
		class sideBar_label10: sideBar_label1{
			idc = 49;
		};

		class sideBar_cb1: cse_gui_comboBoxBase{
			idc = 50;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
		};
		class sideBar_cb2: sideBar_cb1{
			idc = 51;
		};
		class sideBar_lb3: sideBar_cb1{
			idc = 52;
		};
		class sideBar_lb4: sideBar_cb1{
			idc = 53;
		};
		class sideBar_lb5: sideBar_cb1{
			idc = 54;
		};
		class sideBar_lb6: sideBar_cb1{
			idc = 55;
		};
		class sideBar_lb7: sideBar_cb1{
			idc = 56;
		};
		class sideBar_lb8: sideBar_cb1{
			idc = 57;
		};
		class sideBar_lb9: sideBar_cb1{
			idc = 58;
		};
		class sideBar_lb10: sideBar_cb1{
			idc = 59;
		};

		class sideBar_button1: cse_gui_buttonBase {
			idc = 60;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			style = ST_CENTER;
			/*animTextureNormal = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureDisabled = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureOver = "cse\cse_sys_cc\data\button_dropdown_menu_hover.paa";
			animTextureFocused = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTexturePressed = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureDefault = "cse\cse_sys_cc\data\button_dropdown_menu.paa";*/
			animTextureNormal = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.4,0.4,0.4,1)";
			animTextureOver = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTextureFocused = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTexturePressed = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTextureDefault = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.9,0.9,0.9,1};
			colorFocused[] = {1,1,1,1};
			color[] = {0.9,0.9,0.9, 1};
  			color2[] = {1,1,1, 1};
			colorBackgroundFocused[] = {1,1,1,1};
		};
		class sideBar_button2: sideBar_button1 {
			idc = 61;
		};
		class sideBar_button3: sideBar_button1 {
			idc = 62;
		};
		class sideBar_button4: sideBar_button1 {
			idc = 63;
		};
		class sideBar_button5: sideBar_button1 {
			idc = 64;
		};
		class sideBar_button6: sideBar_button1 {
			idc = 65;
		};
		class sideBar_button7: sideBar_button1 {
			idc = 66;
		};
		class sideBar_button8: sideBar_button1 {
			idc = 67;
		};
		class sideBar_button9: sideBar_button1 {
			idc = 68;
		};
		class sideBar_button10: sideBar_button1 {
			idc = 69;
		};

		class main_label1: cse_gui_staticBase{
			idc = 240;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "";
			style = ST_RIGHT;
		};
		class main_label2: main_label1 {
			idc = 241;
		};
		class main_label3: main_label1 {
			idc = 242;
		};
		class main_label4: main_label1 {
			idc = 243;
		};
		class main_label5: main_label1 {
			idc = 244;
		};
		class main_label6: main_label1 {
			idc = 245;
		};
		class main_label7: main_label1 {
			idc = 246;
		};
		class main_label8: main_label1 {
			idc = 247;
		};
		class main_label9: main_label1 {
			idc = 248;
		};
		class main_label10: main_label1 {
			idc = 249;
		};

		class main_combo1: cse_gui_comboBoxBase{
			idc = 250;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			sizeEx = 0.031;
			wholeHeight = 0.9;
		};
		class main_combo2: main_combo1{
			idc = 251;
		};
		class main_combo3: main_combo1{
			idc = 252;
		};
		class main_combo4: main_combo1{
			idc = 253;
		};
		class main_combo5: main_combo1{
			idc = 254;
		};
		class main_combo6: main_combo1{
			idc = 255;
		};

		class main_button1: cse_gui_buttonBase {
			idc = 260;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			style = ST_CENTER;
			/*animTextureNormal = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureDisabled = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureOver = "cse\cse_sys_cc\data\button_dropdown_menu_hover.paa";
			animTextureFocused = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTexturePressed = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			animTextureDefault = "cse\cse_sys_cc\data\button_dropdown_menu.paa";
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.9,0.9,0.9,1};
			colorFocused[] = {1,1,1,1};
			color[] = {0.9,0.9,0.9, 1};
  			color2[] = {1,1,1, 1};
			colorBackgroundFocused[] = {1,1,1,1};*/
			animTextureNormal = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.4,0.4,0.4,1)";
			animTextureOver = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTextureFocused = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTexturePressed = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			animTextureDefault = "#(argb,8,8,3)color(0.3,0.3,0.3,1)";
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.9,0.9,0.9,1};
			colorFocused[] = {1,1,1,1};
			color[] = {0.9,0.9,0.9, 1};
  			color2[] = {1,1,1, 1};
			colorBackgroundFocused[] = {1,1,1,1};
		};
		class main_button2: main_button1 {
			idc = 261;
		};
		class main_button3: main_button1 {
			idc = 262;
		};
		class main_button4: main_button1 {
			idc = 263;
		};
		class main_button5: main_button1 {
			idc = 264;
		};
		class main_button6: main_button1 {
			idc = 265;
		};
		class main_button7: main_button1 {
			idc = 266;
		};
		class main_button8: main_button1 {
			idc = 267;
		};
		class main_button9: main_button1 {
			idc = 268;
		};
		class main_button10: main_button1 {
			idc = 269;
		};
		class main_inputField1: cse_gui_editBase
		{
			idc = 270;
			x = 100;
			y = 100;
			h = 0.05;
			w = 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "";
			autocomplete = "";
			font = "PuristaMedium";
			colorBackground[] = { 0, 0, 0, 1};
			colorText[] = { 1, 1, 1, 1};
			colorDisabled[] = { 1, 1, 1, 0.25};
			colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 1};
			colorActive[] = {1,1,1,1};
			tooltip = "";
			canModify = 1;
		};
		class main_inputField2: main_inputField1
		{
			idc = 271;
		};
		class main_inputField3: main_inputField1
		{
			idc = 272;
		};
		class main_inputField4: main_inputField1
		{
			idc = 273;
		};
		class main_inputField5: main_inputField1
		{
			idc = 274;
		};
		class main_inputField6: main_inputField1
		{
			idc = 275;
		};

		class main_lb1: cse_gui_listBoxBase{
			idc = 280;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
		};
		class main_lb2: main_lb1{
			idc = 281;
		};
		class main_lb3: main_lb1{
			idc = 282;
		};
		class main_lb4: main_lb1{
			idc = 283;
		};

		class listBox_APP1: cse_gui_listBoxBase{
			idc=601;
			x = 100;
			y = 100;
			w = 1;
			h = 1;
  			sizeEx = 0.032;
  			rowHeight = 0.03;
			color[] = {0.9,0.9,0.9, 1};
			colorText[] = {0.9,0.9,0.9, 1};
			colorScrollbar[] = {0.9,0.9,0.9, 1};
			colorSelect[] = {0.9,0.9,0.9, 1};
			colorSelect2[] = {0.9,0.9,0.9, 1};
			colorSelectBackground[] = {0.2,0.2,0.2, 1};
			colorSelectBackground2[] = {0.2,0.2,0.2, 1};
			colorBackground[] = {0.1, 0.1, 0.1, 1};
		};
		class app_extraBackground: cse_gui_backgroundBase {
			idc = 602;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			type = CT_STATIC;
			style = ST_LEFT + ST_SHADOW;
			text = "";
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0.9,0.9,0.9,1};
		};
		class app_labelTitle: cse_gui_staticBase{
			idc = 603;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "";
			style = ST_CENTER;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.1,0.1,0.1, 1};
		};

		class labelDesc: cse_gui_staticBase {
			idc = 604;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "";
			style = ST_LEFT + ST_MULTI;
			lineSpacing = 1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.1,0.1,0.1, 1};
		};

		class labelNoSignal: cse_gui_staticBase {
			idc = 605;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "NO SIGNAL";
			style = ST_LEFT;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.1,0.1,0.1, 1};
		};

		class loadScreenBackground: cse_gui_backgroundBase {
			idc = 607;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			type = CT_STATIC;
			style = ST_LEFT + ST_SHADOW;
			text = "";
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0.9,0.9,0.9,1};
		};

		class Progress_Bar1: cse_gui_RscProgress {
		 	idc = 606;
			x = "100 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "100 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorFrame[] = {0,0,0,1};
			colorBar[] = {0.27,0.5,0.31,0.6};
			// colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			texture = "#(argb,8,8,3)color(1,1,1,0.7)";
		};
		class loadingScreen_Label: cse_gui_staticBase{
			idc = 608;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "";
			style = ST_CENTER;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.1,0.1,0.1, 1};
		};
	};
};