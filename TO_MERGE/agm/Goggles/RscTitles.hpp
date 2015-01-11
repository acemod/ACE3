class RscTitles{
	#include "define.hpp"
	
	class RscAGM_Goggles_BaseTitle{
		idd = -1;
		onLoad = "uiNamespace setVariable ['AGM_Goggles_Display', _this select 0]";
		onUnload = "uiNamespace setVariable ['AGM_Goggles_Display', displayNull]";
		fadeIn=0.5;
		fadeOut=0.5;
		movingEnable = false;
		duration = 10e10;
		name = "RscAGM_Goggles_BaseTitle"; 
		class controls;
	};
	
	class RscAGM_Goggles:RscAGM_Goggles_BaseTitle{
		idd = 1044;
		name = "RscAGM_Goggles"; 
		class controls{
			class gogglesImage: RscPicture{
				idc = 10650;
			};
		};
	};
	
	class RscAGM_GogglesEffects:RscAGM_Goggles_BaseTitle{
		idd = 1045;
		onLoad = "uiNamespace setVariable ['AGM_Goggles_DisplayEffects', _this select 0]";
		onUnload = "uiNamespace setVariable ['AGM_Goggles_DisplayEffects', displayNull]";
		name = "RscAGM_GogglesEffects"; 
		fadeIn=0;
		fadeOut=0.5;
		class controls{
			class dirtImage: RscPicture	{
				idc = 10660;
			};
			class dustImage: RscPicture {
				idc = 10662;
			};
		};
	};
};