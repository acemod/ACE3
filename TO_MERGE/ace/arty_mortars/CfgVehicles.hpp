class CfgVehicles {
	class Land;
	class LandVehicle: Land {
		class ACE;
	};
	class StaticWeapon: LandVehicle {
		class Turrets { class MainTurret; };
		class ACE: ACE {
			class ACE_CREWSERVED;
		};
	};
	class StaticMortar: StaticWeapon {
		class Turrets: Turrets { 
			class MainTurret : MainTurret {
				class ViewOptics;
			}; 
		};
		class ACE: ACE {
			class ACE_ARTY {
				shiftingSpeed[] = {5,20}; // NO SHIFT, SHIFT
			};
		};
	};
	class M252 : StaticMortar {};
	class M252_Base: M252 {};
	class M252_US_EP1: M252_Base {};
	
	class ACE_M252: M252_US_EP1 {
		scope = 2;
		model = "\x\ace\addons\sys_arty_mortars\ACE_M252.p3d";
		class Turrets: Turrets {
			class MainTurret: MainTurret { // KI Turret, lock on spawn
				weapons[] = { "ace_arty_m252" };
				magazines[] = {};			
				gunnerOpticsModel = "\x\ace\addons\sys_arty_mortars\SightUnit";
				soundServo[] = {"",0.0001,1};
				class ViewOptics : ViewOptics {
					initFov = 0.0787019;
					minFov = 0.0787019;
					maxFov = 0.0787019;
				};
			};
		};
		vehicleClass = "ACE_Howitzers";
		ACE_ARTY_ISARTY = 1;
		ACE_ARTY_RECOIL = QUOTE(PATHTOF(fnc_recoil.sqf));
		ACE_ARTY_SETUP_OFFSETPOS[] = {-0.135498,0.214844, 0};
		ACE_ARTY_SETUP_OFFSET_STAKEANGLE = -0.55; // this is in mils!!!
		artilleryScanner = 0;
		ARTY_IsArtyVehicle = 0;
		transportMaxWeapons = 1;
		transportSoldier = 0;
		class TransportWeapons {
			class _xx_ace_arty_rangeTable_m252 {
				weapon = "ace_arty_rangeTable_m252";
				count = 1;
			};
		};
		reversed = 1;
		class AnimationSources {
            class MainTurret {
                source = "user";
				animPeriod = 0.01;
				initPhase = 0;
				minValue = -6400;
				maxValue = 6400;
            };
			class MainTurret_RotateFast: MainTurret {
				animPeriod = 0.0001;
			};
            class MainGun {
                source = "user";
                animPeriod = 0.01;
				initPhase = 1100;
				minValue = 800;
				maxValue = 1511;
            };						
			class OpticElevate {
				source = "user";
                animPeriod = 0.01;
				initPhase = 1100;
				minValue = 800;
				maxValue = 1511;
			};				
			class OpticRevolve {
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
				minValue = -200;
				maxValue = 200;
            };
		};
		class ACE: ACE {
			class ACE_ARTY: ACE_ARTY {
				shiftingSpeed[] = {5,20}; // NO SHIFT, SHIFT
			};
		};			
		ACE_Weight = 41.3;
	};
	class ACE_M224: M252_US_EP1 {};
	class ACE_M224_1: ACE_M224 {
		scope = 2;
		model = "\x\ace\addons\sys_arty_mortars\ACE_M224.p3d";
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				weapons[] = { "ace_arty_m224" };
				magazines[] = {};
				gunnerOpticsModel = "\x\ace\addons\sys_arty_mortars\SightUnit";
				soundServo[] = {"",0.0001,1};
				class ViewOptics : ViewOptics {
					initFov = 0.0787019;
					minFov = 0.0787019;
					maxFov = 0.0787019;
				};
			};			
		};
		vehicleClass = "ACE_Howitzers";
		ACE_ARTY_ISARTY = 1;
		ACE_ARTY_RECOIL = QUOTE(PATHTOF(fnc_recoil.sqf));
		ACE_ARTY_SETUP_OFFSETPOS[] = {-0.135498,0.214844, 0};
		ACE_ARTY_SETUP_OFFSET_STAKEANGLE = 0.37; // this is in mils!!!
		
		artilleryScanner = 0;
		ARTY_IsArtyVehicle = 0;	
		transportMaxWeapons = 1;
		transportSoldier = 0;
		class TransportWeapons {
			class _xx_ace_arty_rangeTable_m224 {
				weapon = "ace_arty_rangeTable_m224";
				count = 1;
			};
		};
		reversed = 1;
		class AnimationSources {
            class MainTurret {
                source = "user";
				animPeriod = 0.01;
				initPhase = 0;
				minValue = -6400;
				maxValue = 6400;
            };
			class MainTurret_RotateFast: MainTurret {
				animPeriod = 0.0001;
			};
            class MainGun {
                source = "user";
                animPeriod = 0.01;
				initPhase = 1100;
				minValue = 800;
				maxValue = 1511;
			};
			class OpticElevate {
				source = "user";
                animPeriod = 0.01;
				initPhase = 1100;
				minValue = 800;
				maxValue = 1511;
			};			
			class OpticRevolve {
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
				minValue = -200;
				maxValue = 200;
            };
		};
		class ACE: ACE {
			class ACE_ARTY: ACE_ARTY {
				shiftingSpeed[] = {5,30}; // NO SHIFT, SHIFT
			};
		};		
		ACE_Weight = 21.1;
	};

	class 2b14_82mm : StaticMortar {};
	class 2b14_82mm_base: 2b14_82mm {};
	class 2b14_82mm_TK_GUE_EP1: 2b14_82mm_base {};
	
	class ACE_2b14_82mm : 2b14_82mm_TK_GUE_EP1 {
		scope = 2;
		model = "\x\ace\addons\sys_arty_mortars\ACE_2B14.p3d";
		class Turrets: Turrets {
			class Mainturret: MainTurret {
				weapons[] = { "ace_arty_2b14" };
				magazines[] = {};			
				gunnerOpticsModel = "\x\ace\addons\sys_arty_mortars\SightUnit";
				soundServo[] = {"",0.0001,1};
				class ViewOptics : ViewOptics {
					initFov = 0.0787019;
					minFov = 0.0787019;
					maxFov = 0.0787019;
				};
			};			
		};
		vehicleClass = "ACE_Howitzers";
		ACE_ARTY_ISARTY = 1;
		ACE_ARTY_RECOIL = QUOTE(PATHTOF(fnc_recoil.sqf));	
		ACE_ARTY_SETUP_OFFSETPOS[] = {-0.135498,0.214844, 0};
		ACE_ARTY_SETUP_OFFSET_STAKEANGLE = -0.55; // this is in mils!!!
		artilleryScanner = 0;
		ARTY_IsArtyVehicle = 0;
		transportMaxWeapons = 1;
		transportSoldier = 0;
		class TransportWeapons {
			class _xx_ace_arty_rangeTable_2b14 {
				weapon = "ace_arty_rangeTable_2b14";
				count = 1;
			};
		};
		reversed = 1;
		class AnimationSources {
            class MainTurret {
                source = "user";
				animPeriod = 0.01;
				initPhase = 0;
				minValue = -6400;
				maxValue = 6400;
            };
			class MainTurret_RotateFast: MainTurret {
				animPeriod = 0.0001;
			};
            class MainGun {
                source = "user";
                animPeriod = 0.01;
				initPhase = 1100;
				minValue = 800;
				maxValue = 1511;
            };						
			class OpticElevate {
				source = "user";
                animPeriod = 0.01;
				initPhase = 1100;
				minValue = 800;
				maxValue = 1511;
			};		
			class OpticRevolve {
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
				minValue = -200;
				maxValue = 200;
            };
		};
		class ACE: ACE {
			class ACE_ARTY: ACE_ARTY {
				shiftingSpeed[] = {5,20}; // NO SHIFT, SHIFT
			};
		};		
		ACE_Weight = 41.88;
	};
	class ACE_120Tampella: ACE_M252 {
		displayName = "120mm Tampella";
		model = "\x\ace\addons\sys_arty_mortars\ACE_120_TAMPELLA.p3d";
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				weapons[] = { "ace_arty_120tampella" };		
				gunnerOpticsModel = "\x\ace\addons\sys_arty_mortars\SightUnit";
				class ViewOptics : ViewOptics {
					initFov = 0.0787019;
					minFov = 0.0787019;
					maxFov = 0.0787019;
				};
			};			
		};		
		class TransportWeapons {
			class _xx_ace_arty_rangeTable_m252 {
				weapon = "ace_arty_rangeTable_tampella";
				count = 1;
			};
		};
		ACE_Weight = 151.2;
		ACE_ARTY_SETUP_OFFSETPOS[] = {-0.135498,0.214844, 0};
		ACE_ARTY_SETUP_OFFSET_STAKEANGLE = -0.55; // this is in mils!!!
		class ACE: ACE {
			class ACE_CREWSERVED: ACE_CREWSERVED {
				disassemblyType = "parts";
				weaponProxy = "ACE_120Tampella_Barrel";
				tripod = "ACE_120Tampella_Baseplate";
				canDrag = 0;
			};
			class ACE_ARTY: ACE_ARTY {
				shiftingSpeed[] = {5,20}; // NO SHIFT, SHIFT
			};			
		};		
	}; 
	// TODO: Localize
	class ACE_120Tampella_Barrel: ACE_120Tampella {
		scope = 1;
		armor = 10000;
		displayName = "120mm Tampella Barrel";
		model = "\x\ace\addons\sys_arty_mortars\ACE_120_Tampella_Barrel.p3d";
		class TransportWeapons {};
		class TransportMagazines {};
		transportMaxWeapons = 0;
		transportMaxMagazines = 0;
		ACE_Weight = 86.8;
		class Turrets {};
		hasGunner = 0;
		hssDriver = 0;
		hasCommander = 0;
		class ACE: ACE {
			class ACE_CREWSERVED: ACE_CREWSERVED {
				interaction = "XXX";
				canDrag = 0;
				canCarry = 1;
			};
		};
		attachPosFront[] = {0,-2.1,0.8};
		attachPosRear[] = {0,-2.5,0};
	};
	class ACE_120Tampella_Baseplate: ACE_120Tampella {
		scope = 1;
		armor = 10000;
		displayName = "120mm Tampella Baseplate";
		model = "\x\ace\addons\sys_arty_mortars\ACE_120_Tampella_Baseplate.p3d";
		class TransportWeapons {};
		class TransportMagazines {};
		transportMaxWeapons = 0;
		transportMaxMagazines = 0;
		class Turrets {};
		hasGunner = 0;
		hssDriver = 0;
		hasCommander = 0;
		class ACE: ACE {
			class ACE_CREWSERVED: ACE_CREWSERVED {
				interaction = "XXX";
				canDrag = 0;
				canCarry = 1;
			};
		};		
		ACE_Weight = 64;
		attachPosFront[] = {0,-0.6,0.8};
		attachPosRear[] = {0,-1.3,0};		
	};
};
