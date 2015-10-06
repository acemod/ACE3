#include "script_component.hpp"

class CfgPatches
{
	class ace_m198_howitzer
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_Weapons_F","A3_Static_F","A3_Static_F_Mortar_01"};
		VERSION_CONFIG;
	};
};

class CfgVehicles
{
	class LandVehicle;
	class StaticWeapon: LandVehicle
	{
		class Turrets
		{
			class MainTurret;
		};
	};
	class StaticMortar: StaticWeapon
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics;
			};
		};
	};
	class StaticHowitzer: StaticMortar{};
	
	class ACE_M198_F: StaticHowitzer
	{   
		scope = 2;
		displayName = "M198 Howitzer";
		model=PATHTOF(m198_howitzer\M198_F.p3d);  	

		slingLoadCargoMemoryPoints[] = {"slingload_point_01","slingload_point_02","slingload_point_03","slingload_point_04"};
		
				class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				gunnerAction = "Mortar_Gunner";
				gunnergetInAction = "";
				gunnergetOutAction = "";
				weapons[] = {"mortar_155mm_AMOS"};
				elevationMode = 1;
				initCamElev = 0;
				minCamElev = -35;
				maxCamElev = 35;
				initElev = 0;
				minTurn = -180;
				maxTurn = 180;
				initTurn = 0;
				cameraDir = "look";
				discreteDistance[] = {100,200,300,400,500,700,1000,1600,2000,2400,2800};
				discreteDistanceCameraPoint[] = {"eye"};
				discreteDistanceInitIndex = 5;
				turretInfoType = "RscWeaponRangeArtillery";
				gunnerForceOptics = 1;
				memoryPointGunnerOptics = "eye";
				gunnerOpticsModel = "\A3\Weapons_F\acc\reticle_Mortar_01_F.p3d";
				class ViewOptics: ViewOptics
				{
					initAngleX = 0;
					minAngleX = -30;
					maxAngleX = 30;
					initAngleY = 0;
					minAngleY = -100;
					maxAngleY = 100;
					initFov = 0.174;
					minFov = 0.0077778;
					maxFov = 0.14;
					visionMode[] = {"Normal","NVG"};
				};
				minelev = -30;
				maxelev = 13;
				magazines[] = {"32Rnd_155mm_Mo_shells"};
			};
		};
		
		class AnimationSources {
			class open_breach {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class left_leg {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class right_leg {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class lower_wheels {
				source="user";
				animPeriod=10;
				initPhase=0;
			};
			class lever_wheel {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class lever_shift {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class shift_foot {
				source="user";
				animPeriod=10;
				initPhase=0;
			};
			class deploy_support {
				source="user";
				animPeriod=3;
				initPhase=0;
			};
			class front_shackles_rotate {
				source="user";
				animPeriod=2;
				initPhase=0;
			};
			class mid_shackles_rotate {
				source="user";
				animPeriod=2;
				initPhase=0;
			};
			class rear_shackle_left_rotate {
				source="user";
				animPeriod=2;
				initPhase=0;
			};
			class rear_shackle_right_rotate {
				source="user";
				animPeriod=2;
				initPhase=0;
			};
			class hide_base_plate {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class hide_left_foot {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class hide_right_foot {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class rotate_left_foot {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class rotate_left_foot_2 {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class move_left_foot {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class rotate_right_foot {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class rotate_right_foot_2 {
				source="user";
				animPeriod=0;
				initPhase=0;
			};
			class move_right_foot {
				source="user";
				animPeriod=0;
				initPhase=0;
			};			
			
			class elevation{
				animPeriod=0;
				initPhase=0;
				minValue=-0.279253;
				maxValue=1.09956;
			};
			class main_gun {
				source="elevation";
				animPeriod=0;
				initPhase=0;
				minValue=-0.279253;
				maxValue=1.09956;
			};
			class traverse{
				animPeriod=0;
				initPhase=0;
				minValue=-0.785398;
				maxValue=0.785398;
			};
			class main_turret {
				source="traverse";
				animPeriod=0;
				initPhase=0;
				minValue=-0.785398;
				maxValue=0.785398;
			};
			
			class muzzle_hide_arty {
				source = "reload";
				weapon = "mortar_155mm_AMOS";
			};
			class recoil_source	{
				source = "reload";
				weapon = "mortar_155mm_AMOS";
			};

		};
	};
};

