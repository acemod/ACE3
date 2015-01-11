#define AGM_CrewInfo_TextIDC 11123

#define CT_STRUCTURED_TEXT 13 
#define ST_LEFT 0

class RscTitles {
	titles[]={"AGM_CrewInfo_dialog"};
	class AGM_CrewInfo_dialog {
		idd = -1;
		movingEnable = 1;
		duration = 1; 
		fadein = 0;
		fadeout = 999999;		
		name = "AGM_CrewInfo_dialog";
		controlsBackground[] = {"AGM_CrewInfo_text"};
		onLoad = "uiNamespace setVariable ['AGM_CrewInfo_dialog', _this select 0]";
		onUnload = "uiNamespace setVariable ['AGM_CrewInfo_dialog', objNull]";

		class AGM_CrewInfo_text { 
			idc = AGM_CrewInfo_TextIDC; 
			type = CT_STRUCTURED_TEXT; 
			style = ST_LEFT; 
			x = SafeZonex + SafezoneW - 0.31;
			y = SafeZoneY + SafeZoneH*0.4;
			w = 0.3;
			h = 0.6;
			size = 0.018; 
			colorBackground[] = { 0, 0, 0, 0 };
			colortext[] = {
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
			};
			text="";
			class Attributes {
				align = right;
			};
		};
	};
};
