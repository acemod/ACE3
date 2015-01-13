class cse_interactionGUI {
	idd = 145201;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_interactionGUI', _this select 0];";


	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = 0.138;
			y = 0.17;
			w = 1.2549;
			h = 0.836601;
			text = "";
		};
	};

	class controls {

		class cse_interactionName {
			idc = 111;
			type = CT_STATIC;
			x = 10.44;
			y = 10.75;
			w = 0.3;
			h = 0.04;
			style = ST_CENTER + ST_SHADOW;
			font = "PuristaMedium";
			sizeEx = 0.0406536;
			colorText[] = {0.95, 0.95, 0.95, 1};
			//colorBackground[] = {1, 1, 1, 0};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", 0.9};
			text = "";
		};
		class cse_subMenuName: cse_interactionName {
			idc = 112;
		};
		class cse_subSubMenuName: cse_interactionName {
			idc = 113;
		};

			class cse_option1 : cse_gui_buttonBase {

				idc = 150;
				text = "";
				onButtonClick = "";
				x = 10.4; // add 5 to each
				y = 10.45;
				w = 0.3;
				h = 0.04;
				color[] = {1, 1, 1, 1};
				color2[] = {0,0,0, 1};
				colorText[] = {1, 1, 1,1};
				colorBackground[] = {1,1,1,0.95};
				colorbackground2[] = {1,1,1,0.95};
				colorDisabled[] = {1,1,1,0.6};
				colorFocused[] = {0,0,0,1};
				colorBackgroundFocused[] = {1,1,1,1};
				animTextureNormal = "cse\cse_gui\data\buttonNormal_gradient_top.paa";
				animTextureDisabled = "cse\cse_gui\data\buttonDisabled_gradient.paa";
				animTextureOver = "cse\cse_gui\data\buttonNormal_gradient_top_w.paa";
				animTextureFocused = "cse\cse_gui\data\buttonNormal_gradient_top_w.paa";
				animTexturePressed = "cse\cse_gui\data\buttonNormal_gradient_top_w.paa";
				animTextureDefault = "cse\cse_gui\data\buttonNormal_gradient_top.paa";

			/*	animTextureNormal = "";
				animTextureDisabled = "";
				animTextureOver = "";
				animTextureFocused = "";
				animTexturePressed = "";
				animTextureDefault = "";	*/
			};
			class cse_option2 : cse_option1 {
				idc = 151;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.5;
			};
			class cse_option3 : cse_option1 {
				idc = 152;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.55;
			};
			class cse_option4 : cse_option1 {
				idc = 153;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.6;
			};
			class cse_option5 : cse_option1 {
				idc = 154;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.65;
			};
			class cse_option6 : cse_option1 {
				idc = 155;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.7;
			};
			class cse_option7 : cse_option1 {
				idc = 156;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.75;
			};
			class cse_option8 : cse_option1 {
				idc = 157;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.8;
			};
			class cse_option9 : cse_option1 {
				idc = 158;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.85;
			};
			class cse_option10 : cse_option1 {
				idc = 159;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.9;
			};
			class cse_option11 : cse_option1 {
				idc = 160;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.9;
			};
			class cse_option12 : cse_option1 {
				idc = 161;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.9;
			};
			class cse_option13 : cse_option1 {
				idc = 162;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.9;
			};
			class cse_option14 : cse_option1 {
				idc = 163;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.9;
			};
			class cse_option15 : cse_option1 {
				idc = 164;
				text = "";
				onButtonClick = "";
				x = 10.4;
				y = 10.9;
			};


			// Sub menu Options
			class cse_subMenuButton1 : cse_option1 {
				idc = 201;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.75;
			};
			class cse_subMenuButton2 : cse_option1 {
				idc = 202;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.8;
			};
			class cse_subMenuButton3 : cse_option1 {
				idc = 203;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.85;
			};
			class cse_subMenuButton4 : cse_option1 {
				idc = 204;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.9;
			};
			class cse_subMenuButton5 : cse_option1 {
				idc = 205;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.95;
			};
			class cse_subMenuButton6 : cse_option1 {
				idc = 206;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuButton7 : cse_option1 {
				idc = 207;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuButton8 : cse_option1 {
				idc = 208;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuButton9 : cse_option1 {
				idc = 209;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuButton10 : cse_option1 {
				idc = 210;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuButton11 : cse_option1 {
				idc = 211;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuButton12 : cse_option1 {
				idc = 212;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuButton13 : cse_option1 {
				idc = 213;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuButton14 : cse_option1 {
				idc = 214;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuButton15 : cse_option1 {
				idc = 215;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};


			class cse_subMenuSub1 : cse_option1 {
				idc = 301;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.75;
			};
			class cse_subMenuSub2 : cse_option1 {
				idc = 302;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.8;
			};
			class cse_subMenuSub3 : cse_option1 {
				idc = 303;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.85;
			};
			class cse_subMenuSub4 : cse_option1 {
				idc = 304;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.9;
			};
			class cse_subMenuSub5 : cse_option1 {
				idc = 305;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.95;
			};
			class cse_subMenuSub6 : cse_option1 {
				idc = 306;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuSub7 : cse_option1 {
				idc = 307;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuSub8 : cse_option1 {
				idc = 308;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuSub9 : cse_option1 {
				idc = 309;
				text = "";
				onButtonClick = "";
				x = 10.88;
				y = 10.0;
			};
			class cse_subMenuSub10 : cse_option1 {
				idc = 310;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuSub11 : cse_option1 {
				idc = 311;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuSub12 : cse_option1 {
				idc = 312;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuSub13 : cse_option1 {
				idc = 313;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuSub14 : cse_option1 {
				idc = 314;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};
			class cse_subMenuSub15 : cse_option1 {
				idc = 315;
				text = "";
				onButtonClick = "";
				x = 100.88;
				y = 100.0;
			};

		class iconImg1: cse_gui_backgroundBase {
			idc = 400;
			x = (safezoneX + (safeZoneW - 0.1));
			y = (safezoneY + (safeZoneH - 0.1));
			w = 0.05;
			h = 0.05;
			size = 0.1;
			SizeEx = 0.1;
			colorBackground[] = {0,0,0,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "";
		};

		class option_tags : cse_gui_buttonBase {
			idc = 500;
			text = "";
			onButtonClick = "";
			x = (safezoneX + (safeZoneW - 0.1));
			y = (safezoneY + (safeZoneH - 0.1));
			w = 0.05;
			h = 0.05;
			class TextPos {
				left = 0;
				top = 0;
				right = 0.0;
				bottom = 0.00;
			};
			animTextureNormal = "";
			animTextureDisabled = "";
			animTextureOver = "";
			animTextureFocused = "";
			animTexturePressed = "";
			animTextureDefault = "";
		};

		class iconImg2: iconImg1 {
			idc = 401;
			x = (safezoneX + (safeZoneW - 0.15));
			y = (safezoneY + (safeZoneH - 0.1));
			w = 0.05;
			h = 0.05;
			size = 0.1;
			SizeEx = 0.1;
			colorBackground[] = {0,0,0,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "";
		};
		class iconImg3: iconImg1 {
			idc = 402;
			x = (safezoneX + (safeZoneW - 0.2));
			y = (safezoneY + (safeZoneH - 0.1));
			w = 0.05;
			h = 0.05;
			size = 0.1;
			SizeEx = 0.1;
			colorBackground[] = {0,0,0,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "";
		};

		class option_icon2 : option_tags {
			idc = 501;
			text = "";
			onButtonClick = "";
			x = (safezoneX + (safeZoneW - 0.15));
			y = (safezoneY + (safeZoneH - 0.1));
			w = 0.05;
			h = 0.05;
			class TextPos {
				left = 0;
				top = 0;
				right = 0.0;
				bottom = 0.00;
			};
			animTextureNormal = "";
			animTextureDisabled = "";
			animTextureOver = "";
			animTextureFocused = "";
			animTexturePressed = "";
			animTextureDefault = "";
		};

		class option_icon3 : option_tags {
			idc = 502;
			text = "";
			onButtonClick = "";
			x = (safezoneX + (safeZoneW - 0.2));
			y = (safezoneY + (safeZoneH - 0.1));
			w = 0.05;
			h = 0.05;
			class TextPos {
				left = 0;
				top = 0;
				right = 0.0;
				bottom = 0.00;
			};
			animTextureNormal = "";
			animTextureDisabled = "";
			animTextureOver = "";
			animTextureFocused = "";
			animTexturePressed = "";
			animTextureDefault = "";
		};
	};
};