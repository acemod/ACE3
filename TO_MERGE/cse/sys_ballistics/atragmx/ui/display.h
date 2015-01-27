class cse_ab_ATragMX_Display
{
	name="cse_ab_ATragMX_Display";
	idd=-1;
	onLoad="uiNamespace setVariable ['cse_ab_ATragMX_Display', (_this select 0)]";
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
			x=0.55*safezoneW+safezoneX-0.256;
			y=0.265*safezoneH+safezoneY-0.1;
			w=1.024;
			h=1.024*4/3;
			colorBackground[]={1,1,1,1};
			colorText[]={1,1,1,1};
			text="cse\cse_sys_ballistics\atragmx\data\atrag.paa";
		};
		class POWER: cse_ab_ATragMX_RscButton
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.145;
			y=0.265*safezoneH+safezoneY+0.94;
			w=0.045;
			h=0.045*4/3;
			colorBackground[]={0,0,0,0.0};
			action="closeDialog 0";
		};
		class BACK: POWER
		{
			idc=-1;
			w=0.06;
			x=0.55*safezoneW+safezoneX+0.3122;
			action="call compile preprocessFile 'cse\cse_sys_ballistics\atragmx\init.sqf'; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		class WINDOWS: cse_ab_ATragMX_RscButton
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.130;
			y=0.265*safezoneH+safezoneY+0.88;
			w=0.035;
			h=0.035*4/3;
			colorBackground[]={0,0,0,0.0};
		};
		class OK: WINDOWS
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.347;
			y=0.265*safezoneH+safezoneY+0.878;
		};
		class TOP: cse_ab_ATragMX_RscButton
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.242;
			y=0.265*safezoneH+safezoneY+0.85;
			w=0.03;
			h=0.03;
			colorBackground[]={0,0,0,0.0};
			action="((cse_ab_ATragMX_currentGun select cse_ab_ATragMX_currentTarget) + (count cse_ab_ATragMX_gunList) - 1) % (count cse_ab_ATragMX_gunList) call cse_ab_ATragMX_fnc_change_gun";
		};
		class BOTTOM: TOP
		{
			idc=-1;
			y=0.265*safezoneH+safezoneY+0.955;
			action="((cse_ab_ATragMX_currentGun select cse_ab_ATragMX_currentTarget) + (count cse_ab_ATragMX_gunList) + 1) % (count cse_ab_ATragMX_gunList) call cse_ab_ATragMX_fnc_change_gun";
		};
		class LEFT: cse_ab_ATragMX_RscButton
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.1925;
			y=0.265*safezoneH+safezoneY+0.9;
			w=0.05;
			h=0.03;
			colorBackground[]={0,0,0,0};
			action="call cse_ab_ATragMX_fnc_parse_input; cse_ab_ATragMX_currentTarget = (4 + cse_ab_ATragMX_currentTarget - 1) % 4; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		class RIGHT: LEFT
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.2725;
			action="call cse_ab_ATragMX_fnc_parse_input; cse_ab_ATragMX_currentTarget = (4 + cse_ab_ATragMX_currentTarget + 1) % 4; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		class TOP_LEFT: cse_ab_ATragMX_RscButton
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.162;
			y=0.265*safezoneH+safezoneY+0.82;
			w=0.031;
			h=0.031*4/3;
			colorBackground[]={0,0,0,0.0};
		};
		class TOP_RIGHT: TOP_LEFT
		{
			idc=-1;
			x=0.55*safezoneW+safezoneX+0.315;
		};
		
		class TEXT_GUN_PROFILE: cse_ab_ATragMX_RscText
		{
			idc=1000;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.20;
			w=0.18;
			h=0.03;
			style=ST_LEFT;
			sizeEx=0.025;
			text="";
		};
		class TEXT_D: cse_ab_ATragMX_RscButton
		{
			idc=600;
			w=0.0231;
			x=0.550*safezoneW+safezoneX+0.29;
			y=0.265*safezoneH+safezoneY+0.20;
			colorText[]={0,0,0,1};
			colorDisabled[]={0.8,0.8,0.8,1};
			colorBackgroundDisabled[]={0,0,0,1};
			colorBackgroundActive[]={0,0,0,0};
			text="D";
			action="cse_ab_ATragMX_currentUnit=0; call cse_ab_ATragMX_fnc_update_unit_selection";
		};
		class TEXT_E: TEXT_D
		{
			idc=601;
			x=0.550*safezoneW+safezoneX+0.3131;
			text="E";
			action="cse_ab_ATragMX_currentUnit=1; call cse_ab_ATragMX_fnc_update_unit_selection";
		};
		class TEXT_M: TEXT_E
		{
			idc=602;
			x=0.550*safezoneW+safezoneX+0.3362;		
			text="M";
			action="cse_ab_ATragMX_currentUnit=2; call cse_ab_ATragMX_fnc_update_unit_selection";
		};
		class TEXT_RANGE_CARD: TEXT_D
		{
			idc=603;
			w=0.03;
			x=0.550*safezoneW+safezoneX+0.36;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="RC";
			action="call cse_ab_ATragMX_fnc_toggle_range_card";
		};
		
		class TEXT_GUN: cse_ab_ATragMX_RscButton
		{
			idc=4000;
			w=0.0925;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.25;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="Gun";
		};
		class TEXT_BORE_HEIGHT: TEXT_GUN_PROFILE
		{
			idc=10;
			style=ST_LEFT;
			y=0.265*safezoneH+safezoneY+0.285;
			text="BH";
		};
		class TEXT_BORE_HEIGHT_INPUT: cse_ab_ATragMX_RscEdit
		{
			idc=100;
			w=0.058;
			x=0.550*safezoneW+safezoneX+0.145;
			y=0.265*safezoneH+safezoneY+0.285;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_calculate_target_solution}";
		};
		class TEXT_BULLET_MASS: TEXT_BORE_HEIGHT
		{
			idc=11;
			style=ST_LEFT;
			y=0.265*safezoneH+safezoneY+0.320;
			text="BW";
		};
		class TEXT_BULLET_MASS_INPUT: TEXT_BORE_HEIGHT_INPUT
		{
			idc=110;
			y=0.265*safezoneH+safezoneY+0.320;
		};
		class TEXT_AIR_FRICTION: TEXT_BORE_HEIGHT
		{
			idc=12;
			y=0.265*safezoneH+safezoneY+0.355;
			text="C1";
		};
		class TEXT_AIR_FRICTION_INPUT: TEXT_BORE_HEIGHT_INPUT
		{
			idc=120;
			y=0.265*safezoneH+safezoneY+0.355;
		};
		class TEXT_MUZZLE_VELOCITY: cse_ab_ATragMX_RscButton
		{
			idc=13;
			style=0;
			w=0.03;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.390;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="MV";
		};
		class TEXT_MUZZLE_VELOCITY_INPUT: TEXT_BORE_HEIGHT_INPUT
		{
			idc=130;
			y=0.265*safezoneH+safezoneY+0.390;
		};
		class TEXT_ZERO_RANGE: TEXT_BORE_HEIGHT
		{
			idc=14;
			y=0.265*safezoneH+safezoneY+0.425;
			text="ZR";
		};
		class TEXT_ZERO_RANGE_INPUT: TEXT_BORE_HEIGHT_INPUT
		{
			idc=140;
			y=0.265*safezoneH+safezoneY+0.425;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_update_zero_range}";
		};
		class TEXT_ATMOSPHERE: TEXT_GUN
		{
			idc=4001;
			x=0.550*safezoneW+safezoneX+0.205;
			text="Atmsphr";
		};
		class TEXT_TEMPERATURE: TEXT_BULLET_MASS
		{
			idc=20;
			x=0.550*safezoneW+safezoneX+0.20;
			text="Tmp";
		};
		class TEXT_TEMPERATURE_INPUT: cse_ab_ATragMX_RscEdit
		{
			idc=200;
			w=0.050;
			x=0.550*safezoneW+safezoneX+0.245;
			y=0.265*safezoneH+safezoneY+0.320;
			text="";
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_calculate_target_solution}";
		};
		class TEXT_BAROMETRIC_PRESSURE: TEXT_AIR_FRICTION
		{
			idc=21;
			x=0.550*safezoneW+safezoneX+0.20;
			text="BP";
		};
		class TEXT_BAROMETRIC_PRESSURE_INPUT: TEXT_TEMPERATURE_INPUT
		{
			idc=210;
			y=0.265*safezoneH+safezoneY+0.355;
		};
		class TEXT_RELATIVE_HUMIDITY: TEXT_AIR_FRICTION
		{
			idc=22;
			x=0.550*safezoneW+safezoneX+0.20;
			y=0.265*safezoneH+safezoneY+0.390;
			text="RH";
		};
		class TEXT_RELATIVE_HUMIDITY_INPUT: TEXT_TEMPERATURE_INPUT
		{
			idc=220;
			y=0.265*safezoneH+safezoneY+0.390;
		};
		class TEXT_TARGET_A: cse_ab_ATragMX_RscButton
		{
			idc=500;
			w=0.0231;
			x=0.550*safezoneW+safezoneX+0.205;
			y=0.265*safezoneH+safezoneY+0.425;
			colorText[]={0,0,0,1};
			colorDisabled[]={0.8,0.8,0.8,1};
			colorBackgroundDisabled[]={0,0,0,1};
			colorBackgroundActive[]={0,0,0,0};
			text="A";
			action="call cse_ab_ATragMX_fnc_parse_input; cse_ab_ATragMX_currentTarget=0; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		class TEXT_TARGET_B: TEXT_TARGET_A
		{
			idc=501;
			x=0.550*safezoneW+safezoneX+0.2281;
			text="B";
			action="call cse_ab_ATragMX_fnc_parse_input; cse_ab_ATragMX_currentTarget=1; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		class TEXT_TARGET_C: TEXT_TARGET_B
		{
			idc=502;
			x=0.550*safezoneW+safezoneX+0.2512;
			text="C";
			action="call cse_ab_ATragMX_fnc_parse_input; cse_ab_ATragMX_currentTarget=2; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		class TEXT_TARGET_D: TEXT_TARGET_B
		{
			idc=503;
			x=0.550*safezoneW+safezoneX+0.2743;
			text="D";
			action="call cse_ab_ATragMX_fnc_parse_input; cse_ab_ATragMX_currentTarget=3; call cse_ab_ATragMX_fnc_update_target_selection";
		};
		
		class TEXT_TARGET: TEXT_GUN
		{
			idc=4002;
			x=0.550*safezoneW+safezoneX+0.3;
			text="Target";
		};
		class TEXT_WIND_SPEED: TEXT_BORE_HEIGHT
		{
			idc=30;
			x=0.550*safezoneW+safezoneX+0.3;
			text="WS";
		};
		class TEXT_WIND_SPEED_INPUT: cse_ab_ATragMX_RscEdit
		{
			idc=300;
			w=0.058;
			x=0.550*safezoneW+safezoneX+0.335;
			y=0.265*safezoneH+safezoneY+0.285;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_calculate_target_solution}";
			text="0";
		};
		class TEXT_WIND_DIRECTION: TEXT_BULLET_MASS
		{
			idc=31;
			x=0.550*safezoneW+safezoneX+0.3;
			text="WD";
		};
		class TEXT_WIND_DIRECTION_INPUT: TEXT_WIND_SPEED_INPUT
		{
			idc=310;
			y=0.265*safezoneH+safezoneY+0.32;
		};
		class TEXT_INCLINATION_ANGLE: TEXT_AIR_FRICTION
		{
			idc=32;
			x=0.550*safezoneW+safezoneX+0.3;
			text="IA";
		};
		class TEXT_INCLINATION_ANGLE_INPUT: TEXT_WIND_SPEED_INPUT
		{
			idc=320;
			y=0.265*safezoneH+safezoneY+0.355;
		};
		class TEXT_TARGET_SPEED: TEXT_MUZZLE_VELOCITY
		{
			idc=33;
			x=0.550*safezoneW+safezoneX+0.3;
			text="TS";
			action="call cse_ab_ATragMX_fnc_toggle_target_speed_assist";
		};
		class TEXT_TARGET_SPEED_INPUT: TEXT_WIND_SPEED_INPUT
		{
			idc=330;
			y=0.265*safezoneH+safezoneY+0.39;
		};
		class TEXT_TARGET_RANGE: TEXT_TARGET_SPEED
		{
			idc=34;
			y=0.265*safezoneH+safezoneY+0.425;
			text="TR";
			action="0 call cse_ab_ATragMX_fnc_toggle_target_range_assist";
		};
		class TEXT_TARGET_RANGE_INPUT: TEXT_WIND_SPEED_INPUT
		{
			idc=340;
			y=0.265*safezoneH+safezoneY+0.425;
		};
		
		class TEXT_ELEVATION: TEXT_GUN_PROFILE
		{
			idc=40;
			w=0.05;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.50;
			text="Elev";
		};
		class TEXT_ABSOLUTE: TEXT_GUN_PROFILE
		{
			idc=4003;
			w=0.07;
			style=ST_CENTER;
			x=0.550*safezoneW+safezoneX+0.17;
			y=0.265*safezoneH+safezoneY+0.47;
			text="Abs";
		};
		class TEXT_RELATIVE: TEXT_ABSOLUTE
		{
			idc=4004;
			x=0.550*safezoneW+safezoneX+0.245;
			text="Rel";
		};
		class TEXT_CURRENT: TEXT_ABSOLUTE
		{
			idc=4005;
			x=0.550*safezoneW+safezoneX+0.32;
			text="Cur";
		};
		class TEXT_ELEVATION_OUTPUT_ABSOLUTE: cse_ab_ATragMX_RscEdit
		{
			idc=400;
			w=0.07;
			x=0.550*safezoneW+safezoneX+0.17;
			y=0.265*safezoneH+safezoneY+0.50;
			text="";
		};
		class TEXT_ELEVATION_OUTPUT_RELATIVE: TEXT_ELEVATION_OUTPUT_ABSOLUTE
		{
			idc=401;
			x=0.550*safezoneW+safezoneX+0.2465;
		};
		class TEXT_ELEVATION_INPUT_CURRENT: TEXT_ELEVATION_OUTPUT_ABSOLUTE
		{
			idc=402;
			x=0.550*safezoneW+safezoneX+0.323;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_parse_input; call cse_ab_ATragMX_fnc_update_result}";
		};
		class TEXT_WINDAGE: TEXT_ELEVATION
		{
			idc=41;
			y=0.265*safezoneH+safezoneY+0.535;
			text="Wind";
		};
		class TEXT_WINDAGE_OUTPUT_ABSOLUTE: TEXT_ELEVATION_OUTPUT_ABSOLUTE
		{
			idc=410;
			y=0.265*safezoneH+safezoneY+0.535;
		};
		class TEXT_WINDAGE_OUTPUT_RELATIVE: TEXT_WINDAGE_OUTPUT_ABSOLUTE
		{
			idc=411;
			x=0.550*safezoneW+safezoneX+0.2465;
		};
		class TEXT_WINDAGE_INPUT_CURRENT: TEXT_WINDAGE_OUTPUT_ABSOLUTE
		{
			idc=412;
			x=0.550*safezoneW+safezoneX+0.323;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_parse_input; call cse_ab_ATragMX_fnc_update_result}";
		};
		class TEXT_LEAD: TEXT_GUN
		{
			idc=42;
			w=0.05;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.57;
			text="Lead";
		};
		class TEXT_LEAD_OUTPUT: TEXT_ELEVATION_OUTPUT_ABSOLUTE
		{
			idc=420;
			y=0.265*safezoneH+safezoneY+0.57;
		};
		class TEXT_RESET_SCOPE_ZERO: TEXT_GUN
		{
			idc=4006;
			w=0.07;
			style=ST_CENTER;
			colorBackground[]={0,0,0,0};
			x=0.550*safezoneW+safezoneX+0.2465;
			y=0.265*safezoneH+safezoneY+0.57;
			text="Reset";
			action="call cse_ab_ATragMX_fnc_reset_relative_click_memory";
		};
		class TEXT_UPDATE_SCOPE_ZERO: TEXT_RESET_SCOPE_ZERO
		{
			idc=4007;
			x=0.550*safezoneW+safezoneX+0.323;
			text="Update";
			action="call cse_ab_ATragMX_fnc_update_relative_click_memory";
		};
		class TEXT_GUN_LIST: TEXT_GUN
		{
			idc=4008;
			style=ST_LEFT;
			y=0.265*safezoneH+safezoneY+0.65;
			text="GunList";
			action="call cse_ab_ATragMX_fnc_toggle_gun_list";
		};
		class TEXT_SCOPE_UNIT: TEXT_GUN_LIST
		{
			idc=2000;
			style=ST_CENTER;
			x=0.550*safezoneW+safezoneX+0.205;
			colorBackground[]={0,0,0,0};
			text="TMOA";
			action="call cse_ab_ATragMX_fnc_cycle_scope_unit";
		};
		class TEXT_CALCULATE: TEXT_SCOPE_UNIT
		{
			idc=3000;
			style=ST_RIGHT;
			x=0.550*safezoneW+safezoneX+0.3;
			text="Calc";
			action="call cse_ab_ATragMX_fnc_calculate_target_solution";
		};
		
		class TEXT_RANGE_CARD_SCOPE_UNIT: TEXT_GUN_PROFILE
		{
			idc=5000;
			text="";
		};
		class TEXT_RANGE_CARD_SETUP: cse_ab_ATragMX_RscButton
		{
			idc=5001;
			w=0.055675;
			x=0.550*safezoneW+safezoneX+0.28;
			y=0.265*safezoneH+safezoneY+0.20;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="Setup";
			action="call cse_ab_ATragMX_fnc_toggle_range_card_setup";
		};
		class TEXT_RANGE_CARD_DONE: TEXT_RANGE_CARD_SETUP
		{
			idc=5002;
			x=0.550*safezoneW+safezoneX+0.3362;
			text="Done";
			action="call cse_ab_ATragMX_fnc_toggle_range_card";
		};
		class TEXT_RANGE_CARD_COLUMN_1_CAPTION: cse_ab_ATragMX_RscButton
		{
			idc=5003;
			style=ST_LEFT;
			w=0.07;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.24;
			colorBackground[]={0.15,0.21,0.23,0.3};
			text="Meters";
		};
		class TEXT_RANGE_CARD_COLUMN_2_CAPTION: TEXT_RANGE_CARD_COLUMN_1_CAPTION
		{
			idc=5004;
			x=0.550*safezoneW+safezoneX+0.180625;
			text="Elev";
		};
		class TEXT_RANGE_CARD_COLUMN_3_CAPTION: TEXT_RANGE_CARD_COLUMN_1_CAPTION
		{
			idc=5005;
			x=0.550*safezoneW+safezoneX+0.25125;
			text="Wind";
		};
		class TEXT_RANGE_CARD_COLUMN_4_CAPTION: TEXT_RANGE_CARD_COLUMN_1_CAPTION
		{
			idc=5006;
			x=0.550*safezoneW+safezoneX+0.321875;
			text="TmFlt";
			action="call cse_ab_ATragMX_fnc_cycle_range_card_columns";
		};
		class TEXT_RANGE_CARD_OUTPUT: cse_ab_ATragMX_RscListNBox
		{
			idc=5007;
			idcLeft=50061;
			idcRight=50062;
			w=0.285;
			h=0.42;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.27;
		};
		
		class TEXT_GUN_LIST_OUTPUT: cse_ab_ATragMX_RscListBox
		{
			idc=6000;
			w=0.16;
			h=0.45;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.24;
			colorSelectBackground[]={0.15,0.21,0.23,0.3};
			colorSelectBackground2[]={0.15,0.21,0.23,0.3};
			onMouseButtonDblClick="true call cse_ab_ATragMX_fnc_toggle_gun_list";
		};
		class TEXT_GUN_LIST_COLUMN_CAPTION: TEXT_GUN_PROFILE
		{
			idc=6001;
			w=0.16;
			colorBackground[]={0.15,0.21,0.23,0.3};
			text="AtragGun.gun";
		};
		class TEXT_GUN_LIST_OPEN_GUN: cse_ab_ATragMX_RscButton
		{
			idc=6002;
			style=ST_RIGHT;
			w=0.115;
			x=0.550*safezoneW+safezoneX+0.28;
			y=0.265*safezoneH+safezoneY+0.20;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			sizeEx=0.024;
			text="Open Gun";
			action="true call cse_ab_ATragMX_fnc_toggle_gun_list";
		};
		class TEXT_GUN_LIST_SAVE_GUN: TEXT_GUN_LIST_OPEN_GUN
		{
			idc=6003;
			y=0.265*safezoneH+safezoneY+0.24;
			text="Save Gun";
			action="call cse_ab_ATragMX_fnc_save_gun";
		};
		class TEXT_GUN_LIST_ADD_NEW_GUN: TEXT_GUN_LIST_OPEN_GUN
		{
			idc=6004;
			y=0.265*safezoneH+safezoneY+0.28;
			text="Add New Gun";
			action="false call cse_ab_ATragMX_fnc_show_gun_list; true call cse_ab_ATragMX_fnc_show_add_new_gun";
		};
		class TEXT_GUN_LIST_DELETE_GUN: TEXT_GUN_LIST_OPEN_GUN
		{
			idc=6005;
			y=0.265*safezoneH+safezoneY+0.34;
			text="Delete Gun";
			action="call cse_ab_ATragMX_fnc_delete_gun";
		};
		class TEXT_GUN_LIST_NOTE: TEXT_GUN_LIST_OPEN_GUN
		{
			idc=6006;
			y=0.265*safezoneH+safezoneY+0.40;
			text="Note";
		};
		class TEXT_GUN_LIST_DONE: TEXT_GUN_LIST_OPEN_GUN
		{
			idc=6007;
			y=0.265*safezoneH+safezoneY+0.65;
			text="Done";
			action="false call cse_ab_ATragMX_fnc_toggle_gun_list";
		};
		
		class TEXT_TARGET_RANGE_ASSIST_CAPTION: cse_ab_ATragMX_RscText
		{
			idc=7000;
			style=16+0x200;
			lineSpacing=1.0;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.24;
			w=0.29;
			h=0.10;
			sizeEx=0.022;
			text="When using WIDTH to size a target, UP/Down Angle does not effect range calculation but will effect bullet drop.";
		};
		class TEXT_TARGET_RANGE_ASSIST_MEASUREMENT_METHOD: TEXT_TARGET_RANGE_ASSIST_CAPTION
		{
			idc=7001;
			style=ST_LEFT;
			x=0.550*safezoneW+safezoneX+0.115;
			y=0.265*safezoneH+safezoneY+0.35;
			w=0.12;
			h=0.03;
			sizeEx=0.027;
			text="Using Target:";
		};
		class TEXT_TARGET_RANGE_ASSIST_WIDTH_HEIGHT: cse_ab_ATragMX_RscToolbox
		{
			idc=7002;
			w=0.14;
			x=0.550*safezoneW+safezoneX+0.24;
			y=0.265*safezoneH+safezoneY+0.35;
			strings[]={"Height","Width"};
			values[]={1,0};
			onToolBoxSelChanged="cse_ab_ATragMX_rangeAssistUseTargetHeight=((_this select 1)==0)";
		};
		class TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE: TEXT_TARGET_RANGE_ASSIST_MEASUREMENT_METHOD
		{
			idc=7003;
			style=ST_RIGHT;
			x=0.550*safezoneW+safezoneX+0.10;
			y=0.265*safezoneH+safezoneY+0.4;
			text="Target Size";
		};
		class TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE
		{
			idc=7004;
			y=0.265*safezoneH+safezoneY+0.45;
			text="Image Size";
		};
		class TEXT_TARGET_RANGE_ASSIST_ANGLE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE
		{
			idc=7005;
			y=0.265*safezoneH+safezoneY+0.5;
			text="Angle";
		};
		class TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE
		{
			idc=7006;
			y=0.265*safezoneH+safezoneY+0.55;
			text="Est Range";
		};
		class TEXT_TARGET_RANGE_ASSIST_CALC_1: TEXT_MUZZLE_VELOCITY
		{
			idc=7007;
			w=0.0231;
			x=0.550*safezoneW+safezoneX+0.22;
			y=0.265*safezoneH+safezoneY+0.4;
			sizeEx=0.03;
			text="!";
			action="0 call cse_ab_ATragMX_fnc_calculate_target_range_assist";
		};
		class TEXT_TARGET_RANGE_ASSIST_CALC_2: TEXT_TARGET_RANGE_ASSIST_CALC_1
		{
			idc=7008;
			y=0.265*safezoneH+safezoneY+0.45;
			action="1 call cse_ab_ATragMX_fnc_calculate_target_range_assist";
		};
		class TEXT_TARGET_RANGE_ASSIST_CALC_3: TEXT_TARGET_RANGE_ASSIST_CALC_1
		{
			idc=7009;
			y=0.265*safezoneH+safezoneY+0.55;
			action="2 call cse_ab_ATragMX_fnc_calculate_target_range_assist";
		};
		class TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT: cse_ab_ATragMX_RscEdit
		{
			idc=7010;
			w=0.065;
			x=0.550*safezoneW+safezoneX+0.2475;
			y=0.265*safezoneH+safezoneY+0.4;
		};
		class TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT
		{
			idc=7011;
			y=0.265*safezoneH+safezoneY+0.45;
		};
		class TEXT_TARGET_RANGE_ASSIST_ANGLE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT
		{
			idc=7012;
			y=0.265*safezoneH+safezoneY+0.5;
		};
		class TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT
		{
			idc=7013;
			y=0.265*safezoneH+safezoneY+0.55;
		};
		class TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_UNIT: TEXT_TARGET_RANGE_ASSIST_CALC_1
		{
			idc=7014;
			w=0.07;
			x=0.550*safezoneW+safezoneX+0.32;
			text="cm";
			action="cse_ab_ATragMX_rangeAssistTargetSizeUnit=(cse_ab_ATragMX_rangeAssistTargetSizeUnit+1) % (count cse_ab_ATragMX_rangeAssistTargetSizeUnits); ctrlSetText [7014, cse_ab_ATragMX_rangeAssistTargetSizeUnits select cse_ab_ATragMX_rangeAssistTargetSizeUnit]";
		};
		class TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_UNIT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_UNIT
		{
			idc=7015;
			y=0.265*safezoneH+safezoneY+0.45;
			text="MIL";
			action="cse_ab_ATragMX_rangeAssistImageSizeUnit=(cse_ab_ATragMX_rangeAssistImageSizeUnit+1) % (count cse_ab_ATragMX_rangeAssistImageSizeUnits); ctrlSetText [7015, cse_ab_ATragMX_rangeAssistImageSizeUnits select cse_ab_ATragMX_rangeAssistImageSizeUnit]";
		};
		class TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_UNIT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE
		{
			idc=7016;
			style=ST_LEFT;
			w=0.07;
			x=0.550*safezoneW+safezoneX+0.32;
			text="Meters";
		};
		class TEXT_TARGET_RANGE_ASSIST_DONE: cse_ab_ATragMX_RscButton
		{
			idc=7017;
			style=ST_CENTER;
			w=0.07;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.60;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="Done";
			action="1 call cse_ab_ATragMX_fnc_toggle_target_range_assist";
		};
		class TEXT_TARGET_RANGE_ASSIST_CANCEL: TEXT_TARGET_RANGE_ASSIST_DONE
		{
			idc=7018;
			x=0.550*safezoneW+safezoneX+0.180625;
			text="Cancel";
			action="0 call cse_ab_ATragMX_fnc_toggle_target_range_assist";
		};
		class TEXT_TARGET_RANGE_ASSIST_PREV: TEXT_TARGET_RANGE_ASSIST_DONE
		{
			idc=7019;
			x=0.550*safezoneW+safezoneX+0.25125;
			text="Prev";
			action="";
		};
		class TEXT_TARGET_RANGE_ASSIST_NEXT: TEXT_TARGET_RANGE_ASSIST_DONE
		{
			idc=7020;
			x=0.550*safezoneW+safezoneX+0.321875;
			text="Next";
			action="";
		};
		
		class TEXT_TARGET_SPEED_ASSIST_TARGET_RANGE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE
		{
			idc=8000;
			x=0.550*safezoneW+safezoneX+0.12;
			text="Target Range";
		};
		class TEXT_TARGET_SPEED_ASSIST_NUM_TICKS: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE
		{
			idc=8001;
			x=0.550*safezoneW+safezoneX+0.12;
			text="Num Ticks";
		};
		class TEXT_TARGET_SPEED_ASSIST_TIME: TEXT_TARGET_RANGE_ASSIST_ANGLE
		{
			idc=8002;
			x=0.550*safezoneW+safezoneX+0.12;
			text="Time (secs)";
		};
		class TEXT_TARGET_SPEED_ASSIST_TARGET_ESTIMATED_SPEED: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE
		{
			idc=8003;
			x=0.550*safezoneW+safezoneX+0.12;
			text="Est Speed";
		};
		class TEXT_TARGET_SPEED_ASSIST_TARGET_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT
		{
			idc=8004;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_calculate_target_speed_assist}";
		};
		class TEXT_TARGET_SPEED_ASSIST_NUM_TICKS_INPUT: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_INPUT
		{
			idc=8005;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_calculate_target_speed_assist}";
		};
		class TEXT_TARGET_SPEED_ASSIST_TIME_INPUT: TEXT_TARGET_RANGE_ASSIST_ANGLE_INPUT
		{
			idc=8006;
			onKeyUp="if (_this select 1 == 28) then {call cse_ab_ATragMX_fnc_calculate_target_speed_assist}";
		};
		class TEXT_TARGET_SPEED_ASSIST_TARGET_ESTIMATED_SPEED_OUTPUT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE
		{
			idc=8007;
			w=0.065;
			x=0.550*safezoneW+safezoneX+0.2475;
			y=0.265*safezoneH+safezoneY+0.55;
			colorBackground[]={0.15,0.21,0.23,0.3};
			text="0";
		};
		class TEXT_TARGET_SPEED_ASSIST_TARGET_RANGE_UNIT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_UNIT
		{
			idc=8008;
			y=0.265*safezoneH+safezoneY+0.4;
			text="Meters";
		};
		class TEXT_TARGET_SPEED_ASSIST_NUM_TICKS_UNIT: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_UNIT
		{
			idc=8009;
			text="MIL";
			action="cse_ab_ATragMX_speedAssistNumTicksUnit=(cse_ab_ATragMX_speedAssistNumTicksUnit+1) % (count cse_ab_ATragMX_speedAssistNumTicksUnits); ctrlSetText [8009, cse_ab_ATragMX_speedAssistNumTicksUnits select cse_ab_ATragMX_speedAssistNumTicksUnit]; call cse_ab_ATragMX_fnc_calculate_target_speed_assist";
		};
		class TEXT_TARGET_SPEED_ASSIST_TIMER_START: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_UNIT
		{
			idc=8010;
			y=0.265*safezoneH+safezoneY+0.5;
			text="Start";
			action="execVM '\atragmx\functions\fnc_target_speed_assist_timer.sqf'";
		};
		class TEXT_TARGET_SPEED_ASSIST_TARGET_ESTIMATED_SPEED_UNIT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_UNIT
		{
			idc=8011;
			text="m/s";
		};
		class TEXT_TARGET_SPEED_ASSIST_DONE: TEXT_TARGET_RANGE_ASSIST_DONE
		{
			idc=8012;
			action="1 call cse_ab_ATragMX_fnc_toggle_target_speed_assist";
		};
		class TEXT_TARGET_SPEED_ASSIST_CANCEL: TEXT_TARGET_RANGE_ASSIST_CANCEL
		{
			idc=8013;
			action="0 call cse_ab_ATragMX_fnc_toggle_target_speed_assist";
		};
		class TEXT_TARGET_SPEED_ASSIST_PREV: TEXT_TARGET_RANGE_ASSIST_PREV
		{
			idc=8014;
		};
		class TEXT_TARGET_SPEED_ASSIST_NEXT: TEXT_TARGET_RANGE_ASSIST_NEXT
		{
			idc=8015;
		};
		
		class TEXT_TARGET_SPEED_ASSIST_TIMER_STOP_BACKGROUND: cse_ab_ATragMX_RscButton
		{
			idc=9000;
			w=0.285;
			h=0.49;
			x=0.550*safezoneW+safezoneX+0.11;
			y=0.265*safezoneH+safezoneY+0.2;
			colorBackground[]={0,0,0,0};
			colorBackgroundActive[]={0,0,0,0};
			action="cse_ab_ATragMX_speedAssistTimer=false";
		}
		class TEXT_TARGET_SPEED_ASSIST_TIME_OUTPUT: cse_ab_ATragMX_RscText
		{
			idc=9001;
			x=0.550*safezoneW+safezoneX+0.22;
			y=0.265*safezoneH+safezoneY+0.51;
			w=0.08;
			h=0.09;
			style=ST_CENTER;
			sizeEx=0.05;
			text="0.0";
		};
		class TEXT_TARGET_SPEED_ASSIST_TIMER_STOP: cse_ab_ATragMX_RscButton
		{
			idc=9002;
			style=ST_CENTER;
			w=0.07;
			h=0.04;
			x=0.550*safezoneW+safezoneX+0.225;
			y=0.265*safezoneH+safezoneY+0.60;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="Stop";
			action="cse_ab_ATragMX_speedAssistTimer=false";
		};
		
		class TEXT_RANGE_CARD_SETUP_START_RANGE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE
		{
			idc=10000;
			x=0.550*safezoneW+safezoneX+0.12;
			text="Start Range";
		};
		class TEXT_RANGE_CARD_SETUP_END_RANGE: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE
		{
			idc=10001;
			x=0.550*safezoneW+safezoneX+0.12;
			text="End Range";
		};
		class TEXT_RANGE_CARD_SETUP_INCREMENT: TEXT_TARGET_RANGE_ASSIST_ANGLE
		{
			idc=10002;
			x=0.550*safezoneW+safezoneX+0.12;
			text="Increment";
		};
		class TEXT_RANGE_CARD_SETUP_START_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT
		{
			idc=10003;
			onKeyUp="if (_this select 1 == 28) then {1 call cse_ab_ATragMX_fnc_toggle_range_card_setup}";
		};
		class TEXT_RANGE_CARD_SETUP_END_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_INPUT
		{
			idc=10004;
			onKeyUp="if (_this select 1 == 28) then {1 call cse_ab_ATragMX_fnc_toggle_range_card_setup}";
		};
		class TEXT_RANGE_CARD_SETUP_INCREMENT_INPUT: TEXT_TARGET_RANGE_ASSIST_ANGLE_INPUT
		{
			idc=10005;
			onKeyUp="if (_this select 1 == 28) then {1 call cse_ab_ATragMX_fnc_toggle_range_card_setup}";
		};
		class TEXT_RANGE_CARD_SETUP_DONE: TEXT_TARGET_SPEED_ASSIST_DONE
		{
			idc=10006;
			action="1 call cse_ab_ATragMX_fnc_toggle_range_card_setup";
		};
		class TEXT_RANGE_CARD_SETUP_CANCEL: TEXT_TARGET_SPEED_ASSIST_CANCEL
		{
			idc=10007;
			action="0 call cse_ab_ATragMX_fnc_toggle_range_card_setup";
		};
		class TEXT_RANGE_CARD_SETUP_PREV: TEXT_TARGET_SPEED_ASSIST_PREV
		{
			idc=10008;
		};
		class TEXT_RANGE_CARD_SETUP_NEXT: TEXT_TARGET_SPEED_ASSIST_NEXT
		{
			idc=10009;
		};
		
		class TEXT_ADD_NEW_GUN_CAPTION: cse_ab_ATragMX_RscText
		{
			idc=11000;
			style=ST_LEFT;
			w=0.25;
			h=0.04;
			x=0.550*safezoneW+safezoneX+0.12;
			y=0.265*safezoneH+safezoneY+0.24;
			sizeEx=0.025;
			text="New Gun Name";
		};
		class TEXT_ADD_NEW_GUN_GUN_NAME_INPUT: cse_ab_ATragMX_RscEdit
		{
			idc=11001;
			style=ST_LEFT;
			w=0.225;
			h=0.04;
			x=0.550*safezoneW+safezoneX+0.12;
			y=0.265*safezoneH+safezoneY+0.28;
			text="";
		};
		class TEXT_ADD_NEW_GUN_OK: cse_ab_ATragMX_RscButton
		{
			idc=11002;
			style=ST_CENTER;
			w=0.1;
			h=0.04;
			x=0.550*safezoneW+safezoneX+0.12;
			y=0.265*safezoneH+safezoneY+0.33;
			colorBackground[]={0.15,0.21,0.23,0.3};
			colorFocused[]={0.15,0.21,0.23,0.2};
			text="OK";
			action="call cse_ab_ATragMX_fnc_add_new_gun; false call cse_ab_ATragMX_fnc_show_add_new_gun; true call cse_ab_ATragMX_fnc_show_gun_list";
		};
		class TEXT_ADD_NEW_GUN_CANCEL: TEXT_ADD_NEW_GUN_OK
		{
			idc=11003;
			x=0.550*safezoneW+safezoneX+0.245;
			text="Cancel";
			action="false call cse_ab_ATragMX_fnc_show_add_new_gun; true call cse_ab_ATragMX_fnc_show_gun_list";
		};
	};
};