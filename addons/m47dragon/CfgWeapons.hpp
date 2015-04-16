class Mode_SemiAuto;
class CfgWeapons {
	class LauncherCore;
    class Launcher_Base_F;
    
    class MissileLauncher :  LauncherCore {
        class WeaponSlotsInfo;
    };
    
	class ACE_M47_Dragon_Base : MissileLauncher {
		htMin = 1;
        htMax = 460;
        afMax = 0;
        mfMax = 0;
        mFact = 1;
        tBody = 100;

		scope = 1;
        
		displayName = "M47 TODO Balls";
        reloadTime = 0;
        
		model = PATHTOF(models\M47.p3d);
		value = 15;
		handAnim[] = {QUOTE(PATHTOF(anim\M47.rtm))};
		sound[] = {QUOTE(PATHTOF(sounds\M47_1)),3.1622777,1,1200};
		drySound[] = {QUOTE(PATHTOF(sounds\dry)),0.0001,1,10};
		reloadMagazineSound[] = {QUOTE(PATHTOF(sounds\rocket_reload)),1.0,1,30};
		soundFly[] = {"",3.1622777,1,500};

		magazines[] = {};
        
		canLock = 0;
        
		//weaponInfoType = "ACE_RscOptics_Dragon";
        modelOptics = PATHTOF(models\optics_m47.p3d);
		opticsPPEffects[]={"OpticsCHAbera1","OpticsBlur1"};
		visionMode[] = {"Normal"};
		cameraDir = "look";
        
		nameSound = "aalauncher";
		
		cursor = "missile";
		reloadAction = "ReloadRPG";
        
		shotPos = "konec hlavne";
		shotEnd = "usti hlavne";
        
        class GunParticles
		{
			class effect1
			{
				positionName = "konec hlavne";
				directionName = "usti hlavne";
				effectName = "RocketBackEffectsRPGNT";
			};
		};
        
        modes[] = {"Single"};
		class Single: Mode_SemiAuto
		{
			sounds[] = {"StandardSound"};
			class BaseSoundModeType{};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Launchers\Titan\Titan",3.1622777,1,2000};
				soundBegin[] = {"begin1",1};
			};
			recoil = "recoil_single_titan";
			aiRateOfFire = 5.0;
			aiRateOfFireDistance = 2500;
			minRange = 10;
			minRangeProbab = 0.8;
			midRange = 2500;
			midRangeProbab = 0.9;
			maxRange = 4800;
			maxRangeProbab = 0.1;
		};
		picture = "\A3\Weapons_F_Beta\Launchers\Titan\Data\UI\gear_titan_CA.paa";
		UiPicture = "\A3\Weapons_F\Data\UI\icon_regular_CA.paa";
		class Library
		{
			libTextDesc = "";
		};
		descriptionShort = "";
		
        inertia = 1.2;
		dexterity = 0.8;
        
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 160;
		};
		class ItemInfo
		{
			priority = 3;
		};
		weaponLockDelay = 3;
		weaponLockSystem = 0;
		cmImmunity = 0.9;
		lockAcquire = 0;
        
		class OpticsModes
		{
			class StepScope
			{
				opticsID = 1;
				useModelOptics = 1;
				opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
				opticsFlare = 0;
				opticsZoomMin = 0.08333;
				opticsZoomMax = 0.04167;
				opticsZoomInit = 0.08333;
				distanceZoomMin = 300;
				distanceZoomMax = 300;
				memoryPointCamera = "eye";
				cameraDir = "look";
				visionMode[] = {"Normal"};
				opticsDisablePeripherialVision = 1;
				discretefov[] = {0.08333,0.04167};
				discreteInitIndex = 0;
			};
		};
		//hiddenSelections[] = {"camo_launcher","camo_tube"};
		//UiPicture=PATHTOF(data\Ico\i_at_CA.paa);
        textureType = "semi";
	};
    
    class ACE_M47_Dragon_Static : ACE_M47_Dragon_Base {
        scope = 2;
        displayName = "M47 TODO Balls";
    };

	class ACE_M47_Dragon : ACE_M47_Dragon_Base {
        scope = 2;
        displayName = "M47 TODO Balls";
	};
    
	class ACE_M47_Daysight: ACE_M47_Dragon {
		displayName = "M47 TODO Balls";	// Stay next to tubes in gear dialogs
		model = QUOTE(PATHTOF(models\ace_m47_optic.p3d));
		picture = QUOTE(PATHTOF(data\m47_daysight_item_ca.paa));
		optics = 1;
		weaponInfoType = "RscWeaponEmpty";
		modelOptics = QUOTE(PATHTOF(models\optics_m47));
		reloadaction = "";
		showSwitchAction = 1;
		useAsBinocular = 1;
		uipicture = "";
		descriptionshort = "SU-36/P Daysight";
		ace_disposable = 0;
		magazines[] = {};
		type = 4096;
		opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
		opticsZoomMin = 0.015;
		opticsZoomMax = 0.015;
	};
};