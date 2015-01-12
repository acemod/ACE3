class cse_sys_medicalMenu {
	idd = 314412;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_sys_medicalMenu', _this select 0]; ['cse_sys_medical', true] call cse_fnc_gui_blurScreen; [_this select 0] spawn cse_fnc_onMenuOpen_CMS;";
	onUnload = " ['cse_sys_medical', false] call cse_fnc_gui_blurScreen; ['cse_onMenuOpen_CMS', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;";

	class controlsBackground {

		class HeaderBackground: cse_gui_backgroundBase{
			idc = -1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "#(argb,8,8,3)color(0,0,0,0)";
			//moving = 1;
		};
		class CenterBackground: HeaderBackground {
			/*x = 0.138;
			y = 0.17;
			w = 1.2549;
			h = 0.836601;*/
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			h = "16 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			//text = "#(argb,8,8,3)color(0,0,0,0.65)";
			//text = "cse\cse_sys_medical\data\ui_background.paa";
			text = "#(argb,8,8,3)color(0,0,0,0.8)";
			colorText[] = {0, 0, 0, "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			colorBackground[] = {0,0,0,"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
		};
		class BottomBackground: CenterBackground {
			y = "(18.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))";
			h = "9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};

	class controls {
		class HeaderName {
			idc = 1;
			type = CT_STATIC;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_LEFT + ST_SHADOW;
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.95, 0.95, 0.95, 0.75};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			text = "";
		};

		class IconsBackGroundBar: cse_gui_backgroundBase{
			idc = -1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			//text = "#(argb,8,8,3)color(0,0,0,0.4)";
			text ="cse\cse_sys_medical\data\cse_background_img.paa";
			colorText[] = {1, 1, 1, 0.0};
			//moving = 1;
		};
		class CatagoryLeft: HeaderName {
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_CENTER;
			//colorText[] = {0.6, 0.7, 1.0, 1};
			colorText[] = {1, 1, 1.0, 0.9};
			colorBackground[] = {0,0,0,0};
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			text = $STR_CSE_UI_EXAMINE_TREATMENT;
		};
		class CatagoryCenter: CatagoryLeft {
			x = "13.33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = $STR_CSE_UI_STATUS;
		};
		class CatagoryRight: CatagoryCenter{
			x = "25.66 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = $STR_CSE_UI_OVERVIEW;
		};
		class Line: cse_gui_backgroundBase {
			idc = -1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "37 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.03 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "#(argb,8,8,3)color(1,1,1,0.5)";
		};

		class iconImg1: cse_gui_backgroundBase {
			idc = 111;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.73 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.1)";
			colorBackground[] = {0,0,0,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "cse\cse_sys_medical\data\icons\triage_card_small.paa";
		};
		class iconImg2: iconImg1 {
			idc = 112;
			x = "3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\examine_patient_small.paa";
		};
		class iconImg3: iconImg1 {
			idc = 113;
			x = "4.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\bandage_fracture_small.paa";
		};
		class iconImg4: iconImg1 {
			idc = 114;
			x = "6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\medication_small.paa";
		};
		class iconImg5: iconImg1 {
			idc = 115;
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\airway_management_small.paa";
		};
		class iconImg6: iconImg1 {
			idc = 116;
			x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\advanced_treatment_small.paa";
		};
		class iconImg7: iconImg1 {
			idc = 117;
			x = "10.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\icon_carry.paa"; // to be replaced later on!
		};
		class iconImg8: iconImg1 {
			idc = 118;
			x = "12 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_medical\data\icons\toggle_self_small.paa";
		};


		class BtnIconLeft1: cse_gui_buttonBase {
			idc = 11;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.73 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.1)";
			/*animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.3)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.95)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.2)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.3)";*/

			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.0)";
			action = "['triage'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft2: BtnIconLeft1 {
			idc = 12;
			x = "3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['examine'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft3: BtnIconLeft1 {
			idc = 13;
			x = "4.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['bandage'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft4: BtnIconLeft1 {
			idc = 14;
			x = "6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['medication'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft5: BtnIconLeft1 {
			idc = 15;
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['airway'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft6: BtnIconLeft1 {
			idc = 16;
			x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['advanced'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft7: BtnIconLeft1 {
			idc = 17;
			x = "10.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['drag'] call cse_fnc_displayOptions_CMS;";
		};
		class BtnIconLeft8: BtnIconLeft1 {
			idc = 18;
			x = "12 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['toggle'] call cse_fnc_displayOptions_CMS;";
		};


		class TriageCardList: cse_gui_listBoxBase {
			idc = 212;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			rowHeight = 0.03;
			colorBackground[] = {0, 0, 0, 0.2};
			colorText[] = {1,1, 1, 1.0};
			colorScrollbar[] = {0.95, 0.95, 0.95, 1};
			colorSelect[] = {0.95, 0.95, 0.95, 1};
			colorSelect2[] = {0.95, 0.95, 0.95, 1};
			colorSelectBackground[] = {0, 0, 0, 0.0};
			colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.0};
		};


	// Left side
		class BtnMenu1: BtnIconLeft1 {
			idc = 20;
			y = "5.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {1, 1, 1, 1};
			color2[] = {0,0,0, 1};
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.5,0.5,0.5,0.8};
			colorFocused[] = {0,0,0,1};
  			periodFocus = 1;
 			periodOver = 1;
			/*animTextureNormal = "cse\cse_sys_medical\data\cse_background_img.paa";
			animTextureDisabled = "cse\cse_sys_medical\data\cse_background_img.paa";
			animTextureOver = "cse\cse_sys_medical\data\cse_background_img.paa";
			animTextureFocused = "cse\cse_sys_medical\data\cse_background_img.paa";
			animTexturePressed = "cse\cse_sys_medical\data\cse_background_img.paa";
			animTextureDefault = "cse\cse_sys_medical\data\cse_background_img.paa";*/

			action = "";
		};
		class BtnMenu2: BtnMenu1 {
			idc = 21;
			y = "6.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu3: BtnMenu1 {
			idc = 22;
			y = "7.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu4: BtnMenu1 {
			idc = 23;
			y = "8.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text ="";
		};
		class BtnMenu5: BtnMenu1 {
			idc = 24;
			y = "9.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu6: BtnMenu1 {
			idc = 25;
			y = "10.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu7: BtnMenu1 {
			idc = 26;
			y = "12 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu8: BtnMenu1 {
			idc = 27;
			y = "13.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};



	// center

		class bodyImgBackground: cse_gui_backgroundBase {
			idc = -1;
			x = "13.33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.73 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "12.33 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			colorBackground[] = {1,1,1,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "cse\cse_sys_medical\data\body_background.paa";
		};
		class bodyImgHead: bodyImgBackground {
			idc = 50;
			x = "13.33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.73 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "12.33 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			colorBackground[] = {1,1,1,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "cse\cse_sys_medical\data\body_head.paa";
		};

		class bodyImgTorso: bodyImgHead {
			idc = 51;
			text = "cse\cse_sys_medical\data\body_torso.paa";
		};
		class bodyImgArms_l: bodyImgHead {
			idc = 52;
			text = "cse\cse_sys_medical\data\body_arm_left.paa";
		};
		class bodyImgArms_r: bodyImgHead {
			idc = 53;
			text = "cse\cse_sys_medical\data\body_arm_right.paa";
		};
		class bodyImgLegs_l: bodyImgHead {
			idc = 54;
			text = "cse\cse_sys_medical\data\body_leg_left.paa";
		};
		class bodyImgLegs_r: bodyImgHead {
			idc = 55;
			text = "cse\cse_sys_medical\data\body_leg_right.paa";
		};


		class selectHead: cse_gui_buttonBase {
			idc = 301;
			x = "18.8 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.1)";
			/*animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.4)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.4)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.99)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.99)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.4)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.4)";*/

			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.0)";
			action = "CSE_SELECTED_BODY_PART_CMS = 'head'; [CSE_SYS_MEDICAL_INTERACTION_TARGET] spawn cse_fnc_updateUIInfo_CMS;";
		};
		class selectTorso : selectHead {
			idc = 302;
			x = "18.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.2 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "4.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "CSE_SELECTED_BODY_PART_CMS = 'body'; [CSE_SYS_MEDICAL_INTERACTION_TARGET] spawn cse_fnc_updateUIInfo_CMS;";
		};
		class selectLeftArm: selectHead{
			idc = 303;
			x = "17.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "4.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "CSE_SELECTED_BODY_PART_CMS = 'hand_r'; [CSE_SYS_MEDICAL_INTERACTION_TARGET] spawn cse_fnc_updateUIInfo_CMS;";
		};
		class selectRightArm: selectLeftArm{
			idc = 304;
			x = "20.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "CSE_SELECTED_BODY_PART_CMS = 'hand_l'; [CSE_SYS_MEDICAL_INTERACTION_TARGET] spawn cse_fnc_updateUIInfo_CMS;";
		};
		class selectLeftLeg :selectHead {
			idc = 305;
			x = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "CSE_SELECTED_BODY_PART_CMS = 'leg_r'; [CSE_SYS_MEDICAL_INTERACTION_TARGET] spawn cse_fnc_updateUIInfo_CMS;";
		};
		class selectRightLeg :selectLeftLeg {
			idc = 306;
			x = "19.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "CSE_SELECTED_BODY_PART_CMS = 'leg_l'; [CSE_SYS_MEDICAL_INTERACTION_TARGET] spawn cse_fnc_updateUIInfo_CMS;";
		};


		class TriageTextBottom: HeaderName {
			idc = 2000;
			x = "13.33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_CENTER;
			colorText[] = {1, 1, 1.0, 1};
			colorBackground[] = {0,0.0,0.0,0.7};
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "";
		};



	// Right side

		class InjuryList: cse_gui_listBoxBase {
			idc = 213;
			x = "25.66 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			rowHeight = 0.03;
			colorBackground[] = {0, 0, 0, 0.2};
			colorText[] = {1,1, 1, 1.0};
			colorScrollbar[] = {0.95, 0.95, 0.95, 1};
			colorSelect[] = {0.95, 0.95, 0.95, 1};
			colorSelect2[] = {0.95, 0.95, 0.95, 1};
			colorSelectBackground[] = {0, 0, 0, 0.0};
			colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.5};
		};

	// bottom

		// activity log

		class ActivityLogHeader: CatagoryLeft {
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_CENTER;
			colorText[] = {0.6, 0.7, 1.0, 1};
			colorBackground[] = {0,0,0,0};
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = $STR_CSE_UI_ACTIVITY_LOG;
		};
		class QuickViewHeader: ActivityLogHeader {
			x = "19.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = $STR_CSE_UI_QUICK_VIEW;
		};
		class LineBottomHeaders: Line {
			y = "19.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class ActivityLog:  InjuryList {
			idc = 214;
			style = 16;
			type = 102;
			rows=1;
			colorBackground[] = {0, 0, 0, 1};
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "(19.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))";
			w = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorSelectBackground[] = {0, 0, 0, 0.0};
			colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.0};
			columns[] = {0.0, 0.08};
			canDrag=true;
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
 			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
		};

		class QuikViewLog:  InjuryList {
			idc = 215;
			style = 16;
			type = 102;
			rows=1;
			colorBackground[] = {0, 0, 0, 1};
			x = "21.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "(19.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))";
			w = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorSelectBackground[] = {0, 0, 0, 0.0};
			colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.0};

			columns[] = {0.0, 0.08};
			canDrag=true;
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
 			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
		};

		class selectTriageStatus: cse_gui_buttonBase {
			idc = 2001;
			x = "13.33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_CENTER;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.0)";
			action = "[] call cse_fnc_dropDownTriageCard_CMS;";
		};
		class selectTriageStatusNone: selectTriageStatus {
			idc = 2002;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = $STR_CSE_UI_TRIAGE_NONE;
			style = ST_CENTER;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.9)";
			action = "[] call cse_fnc_dropDownTriageCard_CMS; [CSE_SYS_MEDICAL_INTERACTION_TARGET,0] call cse_fnc_setTriageStatus_CMS;";
		};

		class selectTriageStatusMinor: selectTriageStatus {
			idc = 2003;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = $STR_CSE_UI_TRIAGE_MINOR;
			style = ST_CENTER;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			animTextureNormal = "#(argb,8,8,3)color(0,0.5,0,0.9)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0.5,0,0.9)";
			animTextureOver = "#(argb,8,8,3)color(0,0.5,0,0.9)";
			animTextureFocused = "#(argb,8,8,3)color(0,0.5,0,0.9)";
			animTexturePressed = "#(argb,8,8,3)color(0,0.5,0,0.9)";
			animTextureDefault = "#(argb,8,8,3)color(0,0.5,0,0.9)";
			action = "[] call cse_fnc_dropDownTriageCard_CMS; [CSE_SYS_MEDICAL_INTERACTION_TARGET,1] call cse_fnc_setTriageStatus_CMS;";
		};
		class selectTriageStatusDelayed: selectTriageStatus {
			idc = 2004;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = $STR_CSE_UI_TRIAGE_DELAYED;
			style = ST_CENTER;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			animTextureNormal = "#(argb,8,8,3)color(0.77,0.51,0.08,0.9)";
			animTextureDisabled = "#(argb,8,8,3)color(0.77,0.51,0.08,0.9)";
			animTextureOver = "#(argb,8,8,3)color(0.77,0.51,0.08,0.9)";
			animTextureFocused = "#(argb,8,8,3)color(0.77,0.51,0.08,0.9)";
			animTexturePressed = "#(argb,8,8,3)color(0.77,0.51,0.08,0.9)";
			animTextureDefault = "#(argb,8,8,3)color(0.77,0.51,0.08,0.9)";
			action = "[] call cse_fnc_dropDownTriageCard_CMS; [CSE_SYS_MEDICAL_INTERACTION_TARGET,2] call cse_fnc_setTriageStatus_CMS;";
		};
		class selectTriageStatusImmediate: selectTriageStatus {
			idc = 2005;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = $STR_CSE_UI_TRIAGE_IMMEDIATE;
			style = ST_CENTER;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			animTextureNormal = "#(argb,8,8,3)color(1,0.2,0.2,0.9)";
			animTextureDisabled = "#(argb,8,8,3)color(1,0.2,0.2,0.9)";
			animTextureOver = "#(argb,8,8,3)color(1,0.2,0.2,0.9)";
			animTextureFocused = "#(argb,8,8,3)color(1,0.2,0.2,0.9)";
			animTexturePressed = "#(argb,8,8,3)color(1,0.2,0.2,0.9)";
			animTextureDefault = "#(argb,8,8,3)color(1,0.2,0.2,0.9)";
			action = "[] call cse_fnc_dropDownTriageCard_CMS; [CSE_SYS_MEDICAL_INTERACTION_TARGET,3] call cse_fnc_setTriageStatus_CMS;";
		};
		class selectTriageStatusDeceased: selectTriageStatus {
			idc = 2006;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = $STR_CSE_UI_TRIAGE_DECEASED;
			style = ST_CENTER;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.9)";
			action = "[] call cse_fnc_dropDownTriageCard_CMS; [CSE_SYS_MEDICAL_INTERACTION_TARGET,4] call cse_fnc_setTriageStatus_CMS;";
		};
	};
};