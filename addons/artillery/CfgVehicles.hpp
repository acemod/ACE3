class CfgVehicles {
	class ThingX;
	class Item_Base_F;
	class NonStrategic;
	class ReammoBox_F;
	class LandVehicle;
	class ACE_RepairItem_Base;
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
			class left_foot_translate {
				animPeriod=0;
				initPhase=0;
				minValue=0;
				maxValue=1;
			};
			class move_left_foot {
				source="left_foot_translate";
				animPeriod=0;
				initPhase=0;
				minValue=0;
				maxValue=1;
			};	
			class right_foot_translate {
				animPeriod=0;
				initPhase=0;
				minValue=0;
				maxValue=1;
			};
			class move_right_foot {
				source="right_foot_translate";
				animPeriod=0;
				initPhase=0;
				minValue=0;
				maxValue=1;
			};			
			
			class hide_jack_handle_left {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class hide_jack_handle_right {
				source="user";
				animPeriod=1;
				initPhase=0;
			};
			class jack_left {
				source="user";
				animPeriod=2.5;
				initPhase=1;
			};
			class jack_right {
				source="user";
				animPeriod=2.5;
				initPhase=1;
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
		class ACE_Actions {
			class ACE_Lever_Shift {
				displayName="Speed Shift";
				distance = 1;
				condition = QUOTE(true);
				statement = QUOTE(true);
				showDisabled = 0;
				selection = "pos_lever_shift";
				class ACE_Lever_Down {
					displayName="Down";
					condition = QUOTE(true);
					statement = "_target animate ['lever_shift',-1]";
				};
				class ACE_Lever_Off {
					displayName="Off";
					condition = QUOTE(true);
					statement = "_target animate ['lever_shift',0]";
				};
				class ACE_Lever_Up {
					displayName="Up";
					condition = QUOTE(true);
					statement = "_target animate ['lever_shift',+1]";
				};
			};
			class ACE_Lever_Wheels {
				displayName="Wheels";
				distance = 1.5;
				condition = QUOTE(true);
				statement = QUOTE(true);
				showDisabled = 0;
				selection = "pos_lever_wheel";
				class ACE_Lever_Down {
					displayName="Down";
					condition = QUOTE(true);
					statement = "_target animate ['lever_wheel',-1]";
				};
				class ACE_Lever_Off {
					displayName="Off";
					condition = QUOTE(true);
					statement = "_target animate ['lever_wheel',0]";
				};
				class ACE_Lever_Up {
					displayName="Up";
					condition = QUOTE(true);
					statement = "_target animate ['lever_wheel',+1]";
				};
			};
			class ACE_Support_L {
				displayName = "Support";
				selection = "pos_support_l";
				distance = 1.5;
				condition = QUOTE(true);
				statement = QUOTE(true);
				showDisabled = 0;
				class ACE_Support_Up {
					displayName="Remove Support";
					condition = "_target animationPhase 'deploy_support' < 0.5";
					statement = "_target animate ['deploy_support',1]";
				};
				class ACE_Support_Down{
					displayName="Install Support";
					condition = "_target animationPhase 'deploy_support' > 0.5";
					statement = "_target animate ['deploy_support',0]";
				};
			};
			class ACE_Support_R: ACE_Support_L{
				selection = "pos_support_r";
			};
			class ACE_Foot_Detach_L {
				displayName = "Detach Foot";
				selection = "pos_left_foot";
				distance = 1.75;
				condition = "(_target animationPhase 'hide_left_foot' <= 0) AND (_target animationPhase 'move_left_foot' <= 0)";
				statement = "_target animate ['hide_left_foot',1]";
				showDisabled = 0;
			};
			class ACE_Foot_Detach_R {
				displayName = "Detach Foot";
				selection = "pos_right_foot";
				distance = 1.75;
				condition = "(_target animationPhase 'hide_right_foot' <= 0) AND (_target animationPhase 'move_right_foot' <= 0)";
				statement = "_target animate ['hide_right_foot',1]";
				showDisabled = 0;
			};
			class ACE_Foot_Attach_L {
				displayName = "Attach Foot";
				selection = "pos_left_foot2";
				distance = 1.75;
				condition = "(_target animationPhase 'hide_left_foot' == 1)";
				statement = "_target animate ['move_left_foot',1]; _target animate ['hide_left_foot',0];";
				showDisabled = 0;
			};
			class ACE_Foot_Attach_R {
				displayName = "Attach Foot";
				selection = "pos_right_foot2";
				distance = 1.75;
				condition = "(_target animationPhase 'hide_right_foot' == 1)";
				statement = "_target animate ['move_right_foot',1]; _target animate ['hide_right_foot',0];";
				showDisabled = 0;
			};
        };
	};
	class ACE_M198_Foot_F: ACE_RepairItem_Base {
		scope = 2;
		displayName = "M198 Howitzer Foot";
		model=PATHTOF(m198_howitzer\M198_Foot_F.p3d);  
		vehicleClass = "Static";

		EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition[]) = {0,1,0};
        EGVAR(dragging,dragDirection) = 0;
	};
	class ACE_M198_Baseplate_F: ThingX {
		scope = 2;
		displayName = "M198 Howitzer Baseplate";
		model=PATHTOF(m198_howitzer\M198_Baseplate_F.p3d); 
		vehicleClass = "Static";		
	};
	
	class ACE_M198_Jack_Handle_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "M198 Howitzer Jack Handle";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m198_howitzer\M198_Jack_Handle_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_loadingtray_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\loadingtray_equip_ca.paa);
		vehicleClass = "Static";
	};
	class ACE_155_LoadingTray_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "Loading Tray (155mm Howitzer)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m198_howitzer\Loading_Tray_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_loadingtray_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\loadingtray_equip_ca.paa);
		vehicleClass = "Static";
	};
	class ACE_155_PushRod_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "Loading Push-rod (155mm Howitzer)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m198_howitzer\Push_Rod_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
	};	
};
