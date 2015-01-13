// GBL_BiometricDialog
// Displays a HIIDE inderface for a biometric scan.
// by gobbo

class cse_biometricScanner {
	idd = 432231;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_biometricScanner', _this select 0];";

	class controlsBackground {
		class cse_backgroundImageScanner : cse_backgroundBase {
			text = "cse\cse_sys_advanced_interaction\biometric_scanner\data\biometricScanner_background.paa";
			idc = 21314;
			x = -0.3;
			y = 0.2;
			w = 1.6;
			h = 1;
		};

	};

	class controls {

		class cse_title: cse_staticBase {
			idc = 100;
			x = 0.29;
			y = 0.45;
			w = 0.33825;
			h = 0.104575;
			sizeEx = 0.04;
			text = "HIIDE - ";
		};
		class cse_subtitle: cse_staticBase {
			idc = 101;
			x = 0.29;
			y = 0.49;
			w = 0.33825;
			h = 0.104575;
			sizeEx = 0.025;
			text = "";
		};

		class cse_infoText1: cse_title {
			idc = 111;
			x = 100.3025;
			y = 110.64;
			w = 0.2;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "";
			style = ST_STATIC + ST_CENTER;
		};
		class cse_infoText2: cse_infoText1 {
			idc = 112;
			x = 100.3025;
			y = 110.69;
			w = 0.2;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "";
		};

		class cse_text1: cse_title {
			idc = 121;
			x = 100.3025;
			y = 110.64;
			w = 0.183825;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "NAME: ";
		};
		class cse_text2: cse_text1 {
			idc = 122;
			x = 100.3025;
			y = 110.69;
			w = 0.183825;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "AGE: ";
		};
		class cse_text3: cse_text1 {
			idc = 123;
			x = 100.3025;
			y = 110.74;
			w = 0.183825;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "Known Info: ";
		};
		class cse_text4: cse_text1 {
			idc = 124;
			x = 100.3025;
			y = 110.79;
			w = 0.183825;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "Additional 1: ";
		};
		class cse_text5: cse_text1 {
			idc = 125;
			x = 100.3025;
			y = 110.84;
			w = 0.183825;
			h = 0.104575;
			sizeEx = 0.03021;
			text = "Additional 2: ";
		};
		  class cse_editableBox1: cse_editBase
		  {
			idc = 701;
			x = 100.42;
			y = 110.68;
			h = 0.03;
			w = 0.3;
			sizeEx = 0.03021;
			text = "";
			autocomplete = "";
		  };
		  class cse_editableBox2: cse_editBase
		  {
			idc = 702;
			x = 100.42;
			y = 110.73;
			h = 0.03;
			w = 0.3;
			sizeEx = 0.03021;
			text = "";
			autocomplete = "";
		  };
		  class cse_editableBox3: cse_editBase
		  {
			idc = 703;
			x = 100.42;
			y = 110.78;
			h = 0.03;
			w = 0.3;
			sizeEx = 0.03021;
			text = "";
			autocomplete = "";
		  };
		  class cse_editableBox4: cse_editBase
		  {
			idc = 704;
			x = 100.42;
			y = 110.83;
			h = 0.03;
			w = 0.3;
			sizeEx = 0.03021;
			text = "";
			autocomplete = "";
		  };
		  class cse_editableBox5: cse_editBase
		  {
			idc = 705;
			x = 100.42;
			y = 110.88;
			h = 0.03;
			w = 0.3;
			sizeEx = 0.03021;
			text = "";
			autocomplete = "";
		  };

		class cse_option1 : cse_buttonBase {
			idc = 151;
			text = "";
			onButtonClick = "";
			x = 0.27;
			y = 0.87;
			w = 0.14;
			h = 0.04;
			color[] = {0.0, 0.0, 0.0, 1};
			color2[] = {0.0, 0.0, 0.0, 1};
			colorBackground[] = {1, 1, 1, 1};
			colorbackground2[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.5};
			animTextureNormal = "cse\cse_sys_advanced_interaction\biometric_scanner\data\scanner_button.paa";
			animTextureDisabled = "cse\cse_sys_advanced_interaction\biometric_scanner\data\scanner_button.paa";
			animTextureOver = "cse\cse_sys_advanced_interaction\biometric_scanner\data\scanner_button.paa";
			animTextureFocused = "cse\cse_sys_advanced_interaction\biometric_scanner\data\scanner_button.paa";
			animTexturePressed = "cse\cse_sys_advanced_interaction\biometric_scanner\data\scanner_button.paa";
			animTextureDefault = "cse\cse_sys_advanced_interaction\biometric_scanner\data\scanner_button.paa";
		};
		class cse_option2 : cse_option1 {
			idc = 152;
			text = "";
			x = 0.425;
		};
		class cse_option3 : cse_option1 {
			idc = 153;
			text = "";
			x = 0.58;
		};
	};
	objects[] = {};
};