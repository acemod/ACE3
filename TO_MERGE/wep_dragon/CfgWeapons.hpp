class CfgWeapons {
	class Weapon_Bag_Base;
	class B_AT_01_weapon_F: Weapon_Bag_Base {
	};
	class ACE_M47StaticLauncher: B_AT_01_weapon_F {
		displayName = "M47 Dragon";
		canLock = 0;
		handAnim[] = {"OFP2_ManSkeleton","\Ca\weapons_E\Data\Anim\M47.rtm"};
		sound[] = {"Ca\Sounds_E\Weapons_E\M47\M47_1",3.1622777,1,1200};
		drySound[] = {"Ca\Sounds_E\Weapons_E\M47\dry",0.0001,1,10};
		reloadMagazineSound[] = {"Ca\Sounds_E\Weapons_E\M47\rocket_reload",1.0,1,30};
		soundFly[] = {"",3.1622777,1,500};
		initSpeed = 20;
		magazines[] = {"Dragon_EP1"};
		reloadTime = 0;
		magazineReloadTime = 0;
	};

	class Launcher;
	class M47Launcher_EP1: Launcher {
		displayName = "M47 Dragon";
		canlock = 0;
		model = QUOTE(PATHTOF(models\ace_m47_magazine.p3d));
		picture = QUOTE(PATHTOF(textures\m47_dragon_item_ca.paa));
	};
	class ACE_M47_Daysight: M47Launcher_EP1 {
		displayName = $STR_DN_ACE_DRAGONSUP36;	// Stay next to tubes in gear dialogs
		model = QUOTE(PATHTOF(models\ace_m47_optic.p3d));
		picture = QUOTE(PATHTOF(textures\m47_daysight_item_ca.paa));
		optics = 1;
		weaponInfoType = "RscWeaponEmpty";
		modelOptics = "\ca\Weapons_e\optics_m47";
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