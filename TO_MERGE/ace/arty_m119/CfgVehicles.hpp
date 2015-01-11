class CfgVehicles {
	class Land;
	class LandVehicle: Land {
		class NewTurret;
	};
	class StaticWeapon: LandVehicle {
		class Turrets;
	};
	class StaticCannon: StaticWeapon {
		class Turrets: Turrets {
			class MainTurret;
		};
	};
	class ace_arty_howtizer: StaticCannon {
		class Turrets: Turrets {
			class MainTurret;
		};
	};
	class ace_arty_m119_base: ace_arty_howtizer {
		class Turrets: Turrets {
			class MainTurret : MainTurret {
				class ViewOptics;
			};
		};
	};
	class ace_arty_m119 : ace_arty_m119_base {
		ACE_ARTY_ISARTY = 1;
		ACE_ARTY_RECOIL = QUOTE(PATHTOF(fnc_recoil.sqf));
		scope = 2;
		side = 1;
		faction = "BIS_US";
		crew = "US_Soldier_EP1";
		displayName = "ACE M119";
        model = "\x\ace\addons\sys_arty_m119\ace_arty_m119.p3d";
		artilleryScanner = 0;
		ARTY_IsArtyVehicle = 0;
		vehicleClass = "ACE_Howitzers";
		
		sound[] = {"Ca\sounds\Weapons\cannon\gun120",100.0,1,1800};
		//reloadMagazineSound[] = {"\x\ace\addons\sys_arty_m119\sounds\M119breachAction",2.0,1,20};
		picture = "\ca\Weapons\data\ico\M119_CA.paa";
		mapSize = 7;
		icon = "\Ca\weapons\Data\map_ico\icomap_m119_CA.paa";
		cargoAction[] = {};
		typicalCargo[] = {"US_Soldier_EP1"};
		transportSoldier = 0;
		memoryPointsGetInCargo = "pos_cargo";
		memoryPointsGetInCargoDir = "pos_cargo_dir";
		gunnerHasFlares = 1;
		
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				weapons[] = {"ace_arty_m119"};
				magazines[] = {};
				gunnerAction = "M119_Gunner";
				gunnerOpticsModel = "\x\ace\addons\sys_arty_m119\ace_arty_m119_scope";
				gunnerOpticsEffect[] = {"OpticsBlur2"};
				memoryPointsGetInGunner = "pos_gunner_dir";
				memoryPointsGetInGunnerDir = "pos_gunner";
				gunBeg = "gun_muzzle";
				gunEnd = "gun_chamber";
				class ViewOptics : ViewOptics {
					initFov = 0.0787019;
					minFov = 0.0787019;
					maxFov = 0.0787019;
				};
			};
		};
		
		class Library {
			libTextDesc = "$STR_LIB_M119";
		};
		
        class AnimationSources {
			class recoil_source {
				source = "user";
				weapon = "ace_arty_m119";
				animPeriod = 0.125;
				minValue = 0;
				maxValue = -1.07;
			};
            class MainTurret {
                source = "user";
				animPeriod = 0.01;
				initPhase = 0;
				minValue = -6400;
				maxValue = 6400;
            };
            class MainGun {
                source = "user";
                animPeriod = 0.01;
				initPhase = 300;
				minValue = -100;
				maxValue = 1244;
            };
			class M137OpticElevate {
				source = "user";
                animPeriod = 0.01;
				initPhase = 0;
				minValue = -300;
				maxValue = 300;
            };
			class ElevationMountRotate {
				source = "MainGun";
                animPeriod = 0.01;
				initPhase = 300;
				minValue = -100;
				maxValue = 1244;
            };
			
			class M187MountElevate {
                source = "user";
                animPeriod = 0.01;
				initPhase = 300;
				minValue = -100;
				maxValue = 1244;
            };
			class M137OpticRevolve {
                source = "user";
                animPeriod = 0.01;
				initPhase = 0;
				minValue = -6400;
				maxValue = 6400;
            };
			class MainTurretTraverse {
                source = "user";
                animPeriod = 0.01;
				initPhase = 0;
				minValue = -100;
				maxValue = 100;
            };
		};
	};
};
