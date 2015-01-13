
class CSE_RscWeaponSelector {
	idd = 432342;
	movingenable = 0;
	fadein = 0;
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['CSE_RscWeaponSelector', _this select 0]; _this call cse_fnc_onWeaponSelectorOpened_GUI;";

	class controlsBackground {	
		class backgroundTop: cse_gui_backgroundBase{
			idc = 800;
			type = CT_STATIC;
			x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.5, 0.2, 0.1, 0.4};
			colorBackground[] = {0, 0, 0, 0.4};
			text = "cse\cse_gui\radialmenu\data\radial_center_background_full_512.paa";
		};			
		class backgroundCenter: backgroundTop{
			idc = 808;
			text = "cse\cse_gui\radialmenu\data\radial_center_info_background.paa";
		};
		class iconCenter: cse_gui_backgroundBase{
			idc = 710;
			type = CT_STATIC;
			x = "17 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "12 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1, 0.4};
			colorBackground[] = {1,1,1, 0.0};
			text = "";
		};
	};

	class controls {
		class LabelmenuName: cse_gui_staticBase{
			idc = 1;
			x = "17 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorText[] = {1,1,1, 1};
			colorBackground[] = {0,0,0, 0.2};
			text = "";
			style = ST_CENTER;
		};

		class labelCurrentSelectedName: LabelmenuName{
			idc = 2;
			y = "14 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.6)";
		};
		
		/** ICONS FOR INNER CYCIRLE  */
		class InnerCycle_iconTop: cse_gui_backgroundBase{
			idc = 100;
			type = CT_STATIC;
			x = "17.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1, 0.66};
			colorBackground[] = {1,1,1, 0.66};
			text = "";
		};
		
		class InnerCycle_iconCenterLeft : InnerCycle_iconTop {
			idc = 103;
			x = "13.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_iconCenterRight : InnerCycle_iconTop {
			idc = 104;
			x = "24.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_iconBottom : InnerCycle_iconTop {
			idc = 107;
			x = "17.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
	
		/** TEXT */
		class InnerCycle_TextTop: cse_gui_staticBase{
			idc = 200;
			x = "18 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorText[] = {1,1,1, 0.66};
			colorBackground[] = {1,1,1, 0.0};
			text = "";
			style = ST_CENTER;
		};

		class InnerCycle_TextCenterLeft : InnerCycle_TextTop {
			idc = 203;
			x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "15.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_TextCenterRight : InnerCycle_TextTop {
			idc = 204;
			x = "23.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "15.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
	
		class InnerCycle_TextBottom : InnerCycle_TextTop {
			idc = 207;
			x = "18 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};

		class InnerCycle_actionTop : cse_gui_buttonBase {
			idc = 10;
			text = "";
			x = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.7 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			/*animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.6)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0.5)";*/
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			color[] = {1, 1, 1, 1};
			color2[] = {0,0,0, 1};				
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.5,0.5,0.5,0.8};
			colorFocused[] = {0,0,0,1};
			periodFocus = 1;
			periodOver = 1;
			action = "";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 100) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 100) ctrlSetTextColor [1, 1, 1, 0.66];";
		};

	
		class InnerCycle_actionCenterLeft : InnerCycle_actionTop {
			idc = 13;
			text = "";
			x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 103) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 103) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class InnerCycle_actionCenterRight : InnerCycle_actionTop {
			idc = 14;
			text = "";
			x = "23.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 104) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 104) ctrlSetTextColor [1, 1, 1, 0.66];";
		};


		class InnerCycle_actionBottom : InnerCycle_actionTop {
			idc = 17;
			text = "";
			x = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.7 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 107) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RscWeaponSelector') displayCtrl 107) ctrlSetTextColor [1, 1, 1, 0.66];";
		};


	};
};
