class RscTitles
{
	class cse_ab_RscKestrel4500
	{
		idd=-1;
		onLoad="with uiNameSpace do { cse_ab_RscKestrel4500 = _this select 0 };";
		movingEnable=0;
		duration=60;
		fadeIn="false";
		fadeOut="false";
		class controls
		{
			class cse_ab_RscKestrel4500
			{
				idc=75000;
				moving=0;
				type=0;
				font="TahomaB";
				SizeEX=0.025*0.75;
				style=48;
				x=safezoneX-0.05;
				y=safezoneY+0.7;
				w=1.024*0.75;
				h=1.024*4/3*0.75;
				colorBackground[]={1,1,1,1};
				colorText[]={1,1,1,1};
				text="cse\cse_sys_ballistics\kestrel4500\data\kestrel4500.paa";
			
			};
			class RscTextTop: Kestrel4500_RscText
			{
				idc=75100;
				x=safezoneX-0.05+0.40*0.75;
				y=safezoneY+0.7+0.58*0.75;
				w=0.22*0.75;
				h=0.04*0.75;
				SizeEx=0.04*0.75;
				text="";
			};
			class RscTextCenterBig: RscTextTop
			{
				idc=75200;
				y=safezoneY+0.7+0.61*0.75;
				h=0.10*0.75;
				SizeEx=0.06*0.75;
				text="";
			};
			class RscTextCenterLine1Left: RscTextTop
			{
				idc=75300;
				y=safezoneY+0.7+0.60*0.75;
				style=ST_LEFT;
				h=0.10*0.75;
				SizeEx=0.05*0.75;
				text="";
			};
			class RscTextCenterLine2Left: RscTextCenterLine1Left
			{
				idc=75301;
				y=safezoneY+0.7+0.64*0.75;
				text="";
			};
			class RscTextCenterLine3Left: RscTextCenterLine2Left
			{
				idc=75302;
				y=safezoneY+0.7+0.68*0.75;
				text="";
			};
			class RscTextCenterLine1Right: RscTextCenterLine1Left
			{
				idc=75303;
				style=ST_RIGHT;
			};
			class RscTextCenterLine2Right: RscTextCenterLine2Left
			{
				idc=75304;
				style=ST_RIGHT;
			};
			class RscTextCenterLine3Right: RscTextCenterLine3Left
			{
				idc=75305;
				style=ST_RIGHT;
			};
			class RscTextInfoLine1: RscTextTop
			{
				idc=75400;
				y=safezoneY+0.7+0.69*0.75;
				text="";
			};
			class RscTextInfoLine2: RscTextTop
			{
				idc=75401;
				y=safezoneY+0.7+0.72*0.75;
				text="";
			};
		};
	};
};
