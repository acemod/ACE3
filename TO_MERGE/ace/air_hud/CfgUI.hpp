class RscPicture;
class RscText;
class RscControlsGroupNoScrollbars;

class RscInGameUI
{
	class RscUnitInfo
	{
		class CA_Radar: RscControlsGroupNoScrollbars 
		{
			class controls 
			{
				class CA_RadarBackground: RscPicture {
					colorText[] = {0,0,0,0};
					text = "";
				};
				class CA_RadarIcon: RscPicture {
					colorText[] = {0,0,0,0};
				};
				class CA_Heading: RscText {
					colorText[] = {0,0,0,0};
				};
			};
		};
	};
};
class CfgInGameUI
{
	
};