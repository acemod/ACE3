// #define elevationMin "rad -012"
// #define elevationMax "rad +052"

#define elevationMin "rad -016"
#define elevationMax "rad +063"

class CfgSkeletons
{
	class Default 
	{
		isDiscrete = 0;
		skeletonInherit = "";
		skeletonBones[] = {};
	};
	class M198_Skeleton: Default 
	{
		skeletonInherit = "";
		skeletonBones[] = 
		{
			"carriage","",
			"carriage_extra","carriage",
			"shift_foot","carriage",
			"base_plate","carriage",
			"lever_shift","carriage",
			"lever_wheel","carriage",
			"brakes","carriage",
			"wheel_left","brakes",
			"wheel_right","brakes",
			"tyre_left","wheel_left",
			"tyre_right","wheel_right",
			"main_turret","carriage",
			"main_gun","main_turret",
			"main_gun_extra","main_gun",
			"muzzle_flash","main_gun",
			"main_turret_2","main_turret",
			"main_turret_extra","main_turret",
			"mid_shackles","main_turret",
			"front_shackles","main_gun",
			"barrel","main_gun",
			"breach","barrel",
			"hatch","breach",
			
			"support","main_gun",			

			"handwheel01","main_turret",
			"handwheel02","main_turret",
			"handwheel03","main_turret",
			
			"left_leg","carriage",
			"rear_shackle_left","left_leg",
			"left_leg_extra","left_leg",
			"left_leg_extra_2","left_leg",
			"left_foot","left_leg",
			"right_leg","carriage",
			"rear_shackle_right","right_leg",
			"right_leg_extra","right_leg",
			"right_leg_extra_2","right_leg",
			"right_foot","right_leg",	
			
			"absorbers01","main_gun",
			"absorbers02","main_turret",
			"absorbers03","main_turret",
			"absorbers04","main_gun"
		};
	};
};

class CfgModels 
{
	class Default 
	{
		sectionsInherit = "";
		sections[] = {};
		skeletonName = "";
	};
	
	class M198_F: Default 
	{
		skeletonName = "M198_Skeleton";
		sectionsInherit = "Default";
		sections[] = {};
		
		class Animations
		{
			class main_gun 
			{
				type="rotation";
				source="main_gun";
				selection="main_gun";
				axis="elevation_axis";
				minValue=elevationMin;
				maxValue=elevationMax;
				angle0=elevationMin;
				angle1=elevationMax;
			};
			class main_turret                                  
			{
				type="rotation";
				source="main_turret";
				selection="main_turret";
				axis="turret_axis";
				minValue="rad -45";
				maxValue="rad +45";
				angle0="rad -45";
				angle1="rad +45";
			};	

			
			class open_breach
			{
				type="rotation";
				source="open_breach";
				selection="hatch";
				axis="breach_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad -80";
			};
			class left_leg
			{
				type="rotation";
				source="left_leg";
				selection="left_leg";
				axis="leg_left_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad -54";
			};
			class right_leg
			{
				type="rotation";
				source="right_leg";
				selection="right_leg";
				axis="leg_right_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad 54";
			};
			class lower_wheels
			{
				type="rotation";
				source="lower_wheels";
				selection="brakes";
				axis="brakes_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad 90";
			};
			class lever_shift
			{
				type="rotation";
				source="lever_shift";
				selection="lever_shift";
				axis="lever_shift_axis";
				minValue="-1";
				maxValue="1";
				angle0="rad -35";
				angle1="rad +35";
			};
			class lever_wheel
			{
				type="rotation";
				source="lever_wheel";
				selection="lever_wheel";
				axis="lever_wheel_axis";
				minValue="-1";
				maxValue="1";
				angle0="rad -35";
				angle1="rad +35";
			};
			class shift_foot
			{
				type="translation";
				source="shift_foot";
				selection="shift_foot";
				sourceAddress="clamp";
				axis="shift_foot_axis";
				minValue=0;
				maxValue=1;
				offset0=0;
				offset1=1;
			};
			class deploy_support 
			{
				type="rotation";
				source="deploy_support";
				selection="support";
				axis="support_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +136.5";
			};		
			class handwheel01_rotate
			{
				type="rotation";
				source="handwheel01_rotate";
				sourceAddress="loop";
				selection="handwheel01";
				axis="handwheel01_axis";
				minValue="rad -360";
				maxValue="rad +360";
				angle0="rad -360";
				angle1="rad +360";
			};
			class handwheel02_rotate
			{
				type="rotation";
				source="handwheel02_rotate";
				sourceAddress="loop";
				selection="handwheel02";
				axis="handwheel02_axis";
				minValue="rad -360";
				maxValue="rad +360";
				angle0="rad -360";
				angle1="rad +360";
			};
			class handwheel03_rotate
			{
				type="rotation";
				source="handwheel03_rotate";
				sourceAddress="loop";
				selection="handwheel03";
				axis="handwheel03_axis";
				minValue="rad -360";
				maxValue="rad +360";
				angle0="rad -360";
				angle1="rad +360";
			};
			class front_shackles_rotate
			{
				type="rotation";
				source="front_shackles_rotate";
				selection="front_shackles";
				axis="front_shackle_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +80";
			};
			class mid_shackles_rotate
			{
				type="rotation";
				source="mid_shackles_rotate";
				selection="mid_shackles";
				axis="mid_shackle_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +200";
			};
			class rear_shackle_left_rotate
			{
				type="rotation";
				source="rear_shackle_left_rotate";
				selection="rear_shackle_left";
				axis="rear_shackle_left_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +110";
			};
			class rear_shackle_right_rotate
			{
				type="rotation";
				source="rear_shackle_right_rotate";
				selection="rear_shackle_right";
				axis="rear_shackle_right_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad -110";
			};
			
			class hide_base_plate
			{
				type="hide";
				source="hide_base_plate";
				selection="base_plate";
				minValue=0;
				maxValue=1;
				hideValue=1;
			};
			
			class hide_left_foot
			{
				type="hide";
				source="hide_left_foot";
				selection="left_foot";
				minValue=0;
				maxValue=1;
				hideValue=1;
			};
			class hide_right_foot
			{
				type="hide";
				source="hide_right_foot";
				selection="right_foot";
				minValue=0;
				maxValue=1;
				hideValue=1;
			};
			
			class rotate_left_foot
			{
				type="rotation";
				source="rotate_left_foot";
				selection="left_foot";
				axis="left_foot_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad -90";
			};
			class rotate_left_foot_2
			{
				type="rotation";
				source="rotate_left_foot_2";
				selection="left_foot";
				axis="left_foot_axis_2";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +10";
			};
			class move_left_foot
			{
				type="translation";
				source="move_left_foot";
				selection="left_foot";
				axis="left_foot_translate_axis";
				minValue="0";
				maxValue="1";
				offset0=0;
				offset1=-0.685;
			};

			class rotate_right_foot
			{
				type="rotation";
				source="rotate_right_foot";
				selection="right_foot";
				axis="right_foot_axis";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +90";
			};
			class rotate_right_foot_2
			{
				type="rotation";
				source="rotate_right_foot_2";
				selection="right_foot";
				axis="right_foot_axis_2";
				minValue="0";
				maxValue="1";
				angle0="rad 0";
				angle1="rad +10";
			};
			class move_right_foot
			{
				type="translation";
				source="move_right_foot";
				selection="right_foot";
				axis="right_foot_translate_axis";
				minValue="0";
				maxValue="1";
				offset0=0;
				offset1=-0.686;
			};
			
			
			class recoil_begin 
			{
				type="translation";
				source="recoil_source";
				sourceAddress="clamp";
				selection="barrel";
				axis="recoil_axis";
				memory=1;
				minValue=0.250;
				maxValue=0.400;
				offset0=0.000;
				offset1=0.165;
			};
			class recoil_end: recoil_begin
			{
				minValue=0.425;
				maxValue=0.950;
				offset0=+0.000;
				offset1=-0.165;
			};
			class artillery_muzzle_flash
			{
				type="hide";
				source="muzzle_hide_arty";
				selection="muzzle_flash";
				minValue = 0.0;
				maxValue = 1.0;
				hideValue = 0.0;
				unHideValue = 0.99;
				animPeriod = 0.0;
				initPhase = 0.0;
			};
			
			// ABSORBERS SMALL ANIMATIONS
			class absorbers03_00 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(-16.000)";
				maxValue= "rad(-11.460)";
				angle0= "rad(+3.500)";
				angle1= "rad(+0.000)";
			}; 
			class absorbers04_00 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(-16.000)";
				maxValue= "rad(-11.460)";
				angle0= "rad(-0.000)";
				angle1= "rad(+0.000)";
			}; 	
			
			
			class absorbers03_0 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(-11.459)";
				maxValue= "rad(-5.724)";
				angle0= "rad(+5.000)";
				angle1= "rad(+0.000)";
			}; 
			class absorbers04_0 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(-11.459)";
				maxValue= "rad(-5.724)";
				angle0= "rad(-0.500)";
				angle1= "rad(+0.000)";
			}; 			
			
			
			class absorbers03_1 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(-5.723)";
				maxValue= "rad(+0.00)";
				angle0= "rad(+5.000)";
				angle1= "rad(+0.000)";
			}; 
			class absorbers04_1 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(-5.723)";
				maxValue= "rad(+0.00)";
				angle0= "rad(+0.500)";
				angle1= "rad(+0.000)";
			}; 
			
			class absorbers03_2 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(0)";
				maxValue= "rad(9.110)";
				angle0= "rad(0.0000)";
				angle1= "rad(-9.0000)";
			}; 
			class absorbers04_2 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(0)";
				maxValue= "rad(9.110)";
				angle0= "rad(0.0000)";
				angle1= "rad(1.0000)";
			};
			class absorbers03_3 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(9.110)";
				maxValue= "rad(14.381)";
				angle0= "rad(0.0000)";
				angle1= "rad(-6.0000)";
			}; 
			class absorbers04_3 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(9.110)";
				maxValue= "rad(14.381)";
				angle0= "rad(0.0000)";
				angle1= "rad(0.5000)";
			};	
			class absorbers03_4 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(14.382)";
				maxValue= "rad(19.481)";
				angle0= "rad(0.000)";
				angle1= "rad(-5.250)";
			}; 
			class absorbers03_5 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(19.482)";
				maxValue= "rad(22.918)";
				angle0= "rad(0.000)";
				angle1= "rad(-4.000)";
			}; 
			class absorbers03_6 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(22.920)";
				maxValue= "rad(25.783)";
				angle0= "rad(0.000)";
				angle1= "rad(-3.000)";
			}; 
			class absorbers04_6 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(22.920)";
				maxValue= "rad(25.783)";
				angle0= "rad(0.0000)";
				angle1= "rad(-2.000)";
			};	
			class absorbers03_7 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(25.784)";
				maxValue= "rad(28.648)";
				angle0= "rad(0.000)";
				angle1= "rad(-3.500)";
			}; 
			class absorbers03_8 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(28.649)";
				maxValue= "rad(31.513)";
				angle0= "rad(0.000)";
				angle1= "rad(-3.500)";
			}; 
			class absorbers03_9 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(31.514)";
				maxValue= "rad(34.377)";
				angle0= "rad(0.000)";
				angle1= "rad(-3.500)";
			}; 
			class absorbers03_10 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(34.378)";
				maxValue= "rad(40.107)";
				angle0= "rad(0.000)";
				angle1= "rad(-7.500)";
			}; 
			class absorbers04_10 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(34.378)";
				maxValue= "rad(40.107)";
				angle0= "rad(0.0000)";
				angle1= "rad(-3.000)";
			};	
			class absorbers03_11 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(40.108)";
				maxValue= "rad(45.836)";
				angle0= "rad(0.000)";
				angle1= "rad(-7.500)";
			}; 
			class absorbers04_11 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(40.108)";
				maxValue= "rad(45.836)";
				angle0= "rad(0.0000)";
				angle1= "rad(-3.000)";
			};
			class absorbers03_12 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue= "rad(45.837)";
				maxValue= "rad(52.000)";
				angle0= "rad(0.000)";
				angle1= "rad(-10.500)";
			};
			class absorbers04_12 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue= "rad(45.837)";
				maxValue= "rad(52.000)";
				angle0= "rad(0.0000)";
				angle1= "rad(-5.000)";
			};
			
			class absorbers03_13 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers03";
				axis="shocksmall_back_axis";
				minValue="rad(52.100)";
				maxValue= "rad(63.000)";
				angle0= "rad(0.000)";
				angle1= "rad(-13.500)";
			};
			class absorbers04_13 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers04";
				axis="shocksmall_front_axis";
				minValue="rad(52.100)";
				maxValue= "rad(63.000)";
				angle0= "rad(0.0000)";
				angle1= "rad(-5.000)";
			};	
			
			// --------------------------------

			class absorbers01_0 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(-16.000)";
				maxValue= "rad(-11.500)";
				angle0= "rad(+1.750)";
				angle1= "rad(+0.000)";
			}; 
			class absorbers02_0 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(-16.000)";
				maxValue= "rad(-11.500)";
				angle0= "rad(+6.400)";
				angle1= "rad(+0.000)";
			}; 
			
			class absorbers01_1 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(-11.459)";
				maxValue= "rad(-5.731)";
				angle0= "rad(+1.850)";
				angle1= "rad(0.000)";				
			}; 
			class absorbers02_1 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(-11.459)";
				maxValue= "rad(-5.731)";
				angle0= "rad(+6.000)";
				angle1= "rad(0.000)";
			}; 
			class absorbers01_2 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(-5.73)";
				maxValue= "rad(+0.00)";
				angle0= "rad(+0.475)";
				angle1= "rad(+0.000)";
			}; 
			class absorbers02_2 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(-5.73)";
				maxValue= "rad(+0.00)";
				angle0= "rad(+7.55)";
				angle1= "rad(+0.00)";
			}; 

			class absorbers01_3 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(0.001)";
				maxValue= "rad(5.730)";
				angle0= "rad(0.000)";
				angle1= "rad(-1.000)";
			}; 
			class absorbers02_3 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(0.001)";
				maxValue= "rad(5.730)";
				angle0= "rad(0.000)";
				angle1= "rad(-5.500)";
			}; 			

			class absorbers01_4 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(5.731)";
				maxValue= "rad(11.459)";
				angle0= "rad(0.000)";
				angle1= "rad(0.000)";
			}; 
			class absorbers02_4 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(5.731)";
				maxValue= "rad(11.459)";
				angle0= "rad(0.000)";
				angle1= "rad(-6.000)";
			}; 					
			
			class absorbers01_5 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(11.460)";
				maxValue= "rad(17.190)";
				angle0= "rad(0.000)";
				angle1= "rad(0.600)";
			}; 
			class absorbers02_5 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(11.460)";
				maxValue= "rad(17.190)";
				angle0= "rad(0.000)";
				angle1= "rad(-6.000)";
			}; 	
			
			class absorbers01_6 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(17.191)";
				maxValue= "rad(22.918)";
				angle0= "rad(0.000)";
				angle1= "rad(0.245)";
			}; 
			class absorbers02_6 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(17.191)";
				maxValue= "rad(22.918)";
				angle0= "rad(0.000)";
				angle1= "rad(-4.750)";
			}; 
			
			class absorbers01_7 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(22.919)";
				maxValue= "rad(28.648)";
				angle0= "rad(0.000)";
				angle1= "rad(0.500)";
			}; 
			class absorbers02_7 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(22.919)";
				maxValue= "rad(28.648)";
				angle0= "rad(0.000)";
				angle1= "rad(-5.00)";
			}; 
			
			class absorbers01_8 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(28.649)";
				maxValue= "rad(34.380)";
				angle0= "rad(0.000)";
				angle1= "rad(0.500)";
			}; 
			class absorbers02_8 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(28.649)";
				maxValue= "rad(34.380)";
				angle0= "rad(0.000)";
				angle1= "rad(-4.500)";
			}; 
			
			class absorbers01_9 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(34.378)";
				maxValue= "rad(40.107)";
				angle0= "rad(0.000)";
				angle1= "rad(1.150)";
			}; 
			class absorbers02_9 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(34.378)";
				maxValue= "rad(40.107)";
				angle0= "rad(0.000)";
				angle1= "rad(-4.750)";
			}; 
			
			class absorbers01_10 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(40.108)";
				maxValue= "rad(45.837)";
				angle0= "rad(0.000)";
				angle1= "rad(1.350)";
			}; 
			class absorbers02_10 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(40.108)";
				maxValue= "rad(45.837)";
				angle0= "rad(0.000)";
				angle1= "rad(-4.450)";
			}; 
			
			class absorbers01_11 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(45.838)";
				maxValue= "rad(52.000)";
				angle0= "rad(0.000)";
				angle1= "rad(1.500)";
			}; 
			class absorbers02_11 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(45.838)";
				maxValue= "rad(52.000)";
				angle0= "rad(0.000)";
				angle1= "rad(-4.650)";
			};
			
			class absorbers01_12 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers01";
				axis="shocklargetop_axis";
				minValue= "rad(52.001)";
				maxValue= "rad(63.000)";
				angle0= "rad(0.000)";
				angle1= "rad(2.750)";
			}; 
			class absorbers02_12 { 
				type="rotation";
				source="main_gun";
				sourceAddress="clamp";
				selection="absorbers02";
				axis="shocklargebottom_axis";
				minValue= "rad(52.001)";
				maxValue= "rad(63.000)";
				angle0= "rad(0.000)";
				angle1= "rad(-8.250)";
			};
		};
	};
};