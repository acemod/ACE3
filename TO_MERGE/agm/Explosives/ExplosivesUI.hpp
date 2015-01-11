#define GUI_GRID_X (0)
#define GUI_GRID_Y (0)
#define GUI_GRID_W (0.025)
#define GUI_GRID_H (0.04)

#define ST_CENTER 0x02

class RscText;
class RscButton;

#define X_OFFSET 0.25

class RscXSliderH;
class IGUIBack;

class Rsc_AGM_Timer_Slider:RscXSliderH{
    x = 0.4; 
    y = 0.2; 
    w = 0.3; 
    h = "1*((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	colorBackground[] = {0,0,0,0.5};
};

class RscAGM_SelectTimeUI
{
	idd = 8854;
	movingEnable = 0;
	class controls {
		class back:IGUIBack {
			x = X_OFFSET;
			y = 0;
			w = 0.5;
			h = 0.2;
			colorBackground[] = {0, 0, 0, 0.5};
		};
		class header: RscText{
			idc = 8870;
			x = X_OFFSET + 0.005;
			y = 0.005;
			w = 0.49;
			h = 0.05;
			style = ST_CENTER;
			text = "";
		};
		class slider: Rsc_AGM_Timer_Slider {
			idc = 8845;
			x = X_OFFSET + 0.005;
			y = 0.06;
			w = 0.49;
			h = 0.025;
			onSliderPosChanged = "private ['_mins', '_secs'];_mins = floor((_this select 1)/60);_secs=floor((_this select 1) - (_mins*60));ctrlSetText [8870, format[localize 'STR_AGM_Explosives_TimerMenu',_mins, _secs]];";
		};
		class cancelBtn: RscButton {
			idc = 8855;
			x = X_OFFSET + 0.005;
			w = 0.15;
			h = 0.1;
			y = 0.09;
			style = ST_CENTER;
			text = $STR_AGM_Explosives_Cancel;
			action = "closeDialog 0;";
		};
		class approveBtn: RscButton {
			idc = 8860;
			x = X_OFFSET + 0.345;
			y = 0.09;
			h = 0.1;
			w = 0.15;
			style = ST_CENTER;
			text = $STR_AGM_Explosives_SetTime;
			action = "closeDialog 0;";
		};
	};
};
