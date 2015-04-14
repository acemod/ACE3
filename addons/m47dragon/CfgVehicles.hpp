
class MainTurret;
class CfgVehicles {
    class LandVehicle;
    
    class StaticWeapon : LandVehicle {
        class Turrets {
            class MainTurret;
        };
    };
    
    class StaticMGWeapon: StaticWeapon{
		class Turrets : Turrets  {
			class MainTurret : MainTurret {
                class ViewOptics;
            };
		};
	};
    
    class ACE_M47_Dragon_Static_Base : StaticMGWeapon {
		features = "Balls";
        scope = 0;
		displayName = "ACE M47 Dragon";
		class Armory
		{
			description = "$STR_A3_CfgVehicles_HMG_01_Base_Armory0";
		};
		model = QUOTE(PATHTOF(models\ace_m47_static.p3d));
		picture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
		UiPicture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
		icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";
		threat[] = {0.3,1.0,0.3};
		cost = 150000;
		class Damage {
			tex[] = {};
			mat[] = {"a3\static_f_gamma\data\staticturret_01.rvmat","a3\static_f_gamma\data\staticturret_01_damage.rvmat","a3\static_f_gamma\data\staticturret_01_destruct.rvmat","a3\static_f_gamma\data\staticturret_02.rvmat","a3\static_f_gamma\data\staticturret_02_damage.rvmat","a3\static_f_gamma\data\staticturret_02_destruct.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher_damage.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher_destruct.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube_damage.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube_destruct.rvmat"};
		};
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				optics = 1;
				turretInfoType = "RscOptics_titan";
				gunnerOpticsModel = "\A3\Weapons_F_Beta\acc\reticle_titan.p3d";
				minElev = -20;
				weapons[] = {"missiles_titan_static"};
				magazines[] = {"1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles"};
				gunnerAction = "gunner_staticlauncher";
				gunnergetInAction = "";
				gunnergetOutAction = "";
				displayName = "";
				class ViewOptics: ViewOptics
				{
					initAngleX = 0;
					minAngleX = -30;
					maxAngleX = 30;
					initAngleY = 0;
					minAngleY = -100;
					maxAngleY = 100;
					initFov = 0.08333;
					minFov = 0.04167;
					maxFov = 0.08333;
					visionMode[] = {"Normal","Ti"};
					thermalMode[] = {0,1};
				};
				gunnerRightHandAnimName = "OtocHlaven_shake";
				gunnerLeftHandAnimName = "OtocHlaven_shake";
				gunBeg = "Usti hlavne";
				gunEnd = "Konec hlavne";
				memoryPointGunnerOptics = "look";
			};
		};
		class AnimationSources
		{
			class autonomous_unhide
			{
				source = "user";
				animPeriod = 1e-006;
				initPhase = 0;
			};
			class muzzle_source
			{
				source = "reload";
				weapon = "missiles_titan";
			};
			class muzzle_source_rot
			{
				source = "ammorandom";
				weapon = "missiles_titan";
			};
			class ReloadAnim
			{
				source = "reload";
				weapon = "missiles_titan";
			};
			class ReloadMagazine
			{
				source = "reloadmagazine";
				weapon = "missiles_titan";
			};
			class Revolving
			{
				source = "revolving";
				weapon = "missiles_titan";
			};
		};
		soundGetOut[] = {"A3\sounds_f\dummysound",0.001,1,5};
		soundGetIn[] = {"A3\sounds_f\dummysound",0.00031622776,1,5};
		armorStructural = 10.0;
		class assembleInfo
		{
			primary = 0;
			base = "";
			assembleTo = "";
			dissasembleTo[] = {};
			displayName = "";
		};
		hiddenSelections[] = {"camo_launcher","camo_tube"};
	};

    class ACE_M47_Dragon_Static : ACE_M47_Dragon_Static_Base {
        author = "ACE Team";
		_generalMacro = "O_static_AT_F";
		scope = 2;
		displayname = "ACE_M47_Dragon_Static";
		side = 1;
		faction = "BLU_F";
		crew = "B_soldier_f";
		hiddenSelectionsTextures[] = {"\a3\weapons_f_beta\launchers\titan\data\launcher_co.paa","\a3\weapons_f_beta\launchers\titan\data\tubem_co.paa"};
		class assembleInfo: assembleInfo
		{
			dissasembleTo[] = {"B_AT_01_weapon_F","B_HMG_01_support_F"};
		};
    };
};