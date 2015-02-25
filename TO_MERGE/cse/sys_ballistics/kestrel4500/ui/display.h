class cse_ab_Kestrel4500_Display {
	name="cse_ab_Kestrel4500_Display";
	idd=790542;
	onLoad="uiNamespace setVariable ['cse_ab_Kestrel4500_Display', (_this select 0)]";
	movingEnable=1;
	controlsBackground[]={};
	objects[]={};
	class controls
	{
		class BACKGROUND
		{
			moving=1;
			type=0;
			font="TahomaB";
			SizeEX=0.025;
			idc=-1;
			style=48;
			x=safezoneX;
			y=safezoneY;
			w=1.024;
			h=1.024*4/3;
			colorBackground[]={1,1,1,1};
			colorText[]={1,1,1,1};
			text="cse\cse_sys_ballistics\kestrel4500\data\kestrel4500.paa";

		};
		class POWER: Kestrel4500_RscButton
		{
			idc=-1;
			x=safezoneX+0.385;
			y=safezoneY+1.125;
			w=0.042;
			h=0.042*4/3;
			action="closeDialog 0";
			onMouseButtonDown = "playSound 'cse_ab_kestrel4500_exit_button_click'";			
		};
		class ENTER: POWER
		{
			idc=-1;
			x=safezoneX+0.46;
			y=safezoneY+1.0;
			w=0.1;
			action="0 call CSE_ab_kestrel4500_fnc_button_pressed;";
			onMouseButtonDown = "playSound 'cse_ab_kestrel4500_center_button_click'";			
		};
		class TOP: Kestrel4500_RscButton
		{
			idc=-1;
			x=safezoneX+0.46;
			y=safezoneY+0.93;
			w=0.1;
			h=0.03;
			action="1 call CSE_ab_kestrel4500_fnc_button_pressed;";
			onMouseButtonDown = "playSound 'cse_ab_kestrel4500_top_button_click'";
		};
		class BOTTOM: TOP
		{
			idc=-1;
			y=safezoneY+1.1;
			action="2 call CSE_ab_kestrel4500_fnc_button_pressed;";
			onMouseButtonDown = "playSound 'cse_ab_kestrel4500_bottom_button_click'";
		};
		class LEFT: Kestrel4500_RscButton
		{
			idc=-1;
			x=safezoneX+0.4;
			y=safezoneY+0.97;
			w=0.046;
			h=0.11;
			action="3 call CSE_ab_kestrel4500_fnc_button_pressed;";
			onMouseButtonDown = "playSound 'cse_ab_kestrel4500_left_button_click'";			
		};
		class RIGHT: LEFT
		{
			idc=-1;
			x=safezoneX+0.58;
			action="4 call CSE_ab_kestrel4500_fnc_button_pressed;";
			onMouseButtonDown = "playSound 'cse_ab_kestrel4500_right_button_click'";
		};
		class MEMORY: Kestrel4500_RscButton
		{
			idc=-1;
			x=safezoneX+0.395;
			y=safezoneY+0.87;
			w=0.05;
			h=0.045*4/3;
			action="5 call CSE_ab_kestrel4500_fnc_button_pressed;";
		};
		class BACKLIGHT: MEMORY
		{
			idc=-1;
			x=safezoneX+0.585;
			action="6 call CSE_ab_kestrel4500_fnc_button_pressed;";
		};
		
		class TEXT_TOP: Kestrel4500_RscText
		{
			idc=74100;
			x=safezoneX+0.40;
			y=safezoneY+0.58;
			w=0.22;
			h=0.04;
			text="";
		};
		class TEXT_CENTER_BIG: TEXT_TOP
		{
			idc=74200;
			y=safezoneY+0.61;
			h=0.10;
			SizeEx=0.06;
			text="";
		};
		class TEXT_CENTER_LINE_1_LEFT: TEXT_TOP
		{
			idc=74300;
			y=safezoneY+0.60;
			style=ST_LEFT;
			h=0.10;
			SizeEx=0.05;
			text="";
		};
		class TEXT_CENTER_LINE2_LEFT: TEXT_CENTER_LINE_1_LEFT
		{
			idc=74301;
			y=safezoneY+0.64;
			text="";
		};
		class TEXT_CENTER_LINE_3_LEFT: TEXT_CENTER_LINE2_LEFT
		{
			idc=74302;
			y=safezoneY+0.68;
			text="";
		};
		class TEXT_CENTER_LINE_1_RIGHT: TEXT_CENTER_LINE_1_LEFT
		{
			idc=74303;
			style=ST_RIGHT;
		};
		class TEXT_CENTER_LINE2_RIGHT: TEXT_CENTER_LINE2_LEFT
		{
			idc=74304;
			style=ST_RIGHT;
		};
		class TEXT_CENTER_LINE_3_RIGHT: TEXT_CENTER_LINE_3_LEFT
		{
			idc=74305;
			style=ST_RIGHT;
		};
		class TEXT_INFO_LINE_1: TEXT_TOP
		{
			idc=74400;
			y=safezoneY+0.69;
			text="";
		};
		class TEXT_INFO_LINE_2: TEXT_TOP
		{
			idc=74401;
			y=safezoneY+0.72;
			text="";
		};
	};
};