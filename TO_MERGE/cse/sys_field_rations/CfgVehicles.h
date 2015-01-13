class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {};
	};
	class cse_sys_field_rations: Module_F {
		scope = 2; 
		displayName = "Field Rations [CSE]";
		icon = "\cse\cse_main\data\cse_basic_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {
			class timeWithoutWater {
				displayName = "Time without water";
				description = "How long should a unit be able to go without water"; 
				typeName = "NUMBER";
				class values {
					class Twodays {name="48 hours"; value= 0.5; };
					class 32Hours {name="32 hours"; value= 0.75; };
					class oneDay {name="24 hours"; value=1; default=1; };
					class halfDay {name="12 hours"; value=2; };
					class quarterDay {name="6 hours"; value=4; };
					class eightDay {name="3 hours"; value=8; };
					class oneHour {name="1 hour"; value=24; };
				};
			};
			class timeWithoutFood {
				displayName = "Time without food";
				description = "How long should a unit be able to go without food"; 
				typeName = "NUMBER";
				class values {
					class Twodays {name="48 hours"; value= 0.5; };
					class 32Hours {name="32 hours"; value= 0.75;  default=1;};
					class oneDay {name="24 hours"; value=1; };
					class halfDay {name="12 hours"; value=2; };
					class quarterDay {name="6 hours"; value=4; };
					class eightDay {name="3 hours"; value=8; };
					class oneHour {name="1 hour"; value=24; };
				};
			};			
		};
	};

	class NATO_Box_Base;
	class cse_field_rations_all : NATO_Box_Base {
		scope = 2;
		accuracy = 1000;
		displayName = "Field Rations [All] (CSE)";
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
		author = "Combat Space Enhancement";
		class TransportWeapons {
			class cse_waterbottle {
				weapon = "cse_waterbottle";
				count = 20;
			};
			class _xx_cse_canteen {
				weapon = "cse_canteen";
				count = 20;
			};
			class _xx_cse_MRE_LambC {
				weapon = "cse_MRE_LambC";
				count = 10;
			}; 
			class _xx_cse_MRE_Rice {
				weapon = "cse_MRE_Rice";
				count = 10;
			}; 
			class _xx_cse_MRE_CreamTomatoSoup {
				weapon = "cse_MRE_CreamTomatoSoup";
				count = 10;
			}; 
			class _xx_cse_MRE_CreamChickenSoup {
				weapon = "cse_MRE_CreamChickenSoup";
				count = 10;
			}; 
			class _xx_cse_MRE_ChickenTikkaMassala {
				weapon = "cse_MRE_ChickenTikkaMassala";
				count = 10;
			}; 
			class _xx_cse_MRE_SteakVegetables {
				weapon = "cse_MRE_SteakVegetables";
				count = 10;
			}; 
			class _xx_cse_MRE_MeatballsPasta {
				weapon = "cse_MRE_MeatballsPasta";
				count = 10;
			}; 
			class _xx_cse_MRE_ChickenHerbDumplings {
				weapon = "cse_MRE_ChickenHerbDumplings";
				count = 10;
			}; 
			class _xx_cse_Humanitarian_Ration {
				weapon = "cse_Humanitarian_Ration";
				count = 10;
			};
			class _xx_cse_US_MRE_ChiliBeans {
				weapon = "cse_US_MRE_ChiliBeans";
				count = 10;
			}; 
			class _xx_cse_US_MRE_ChickenFajita {
				weapon = "cse_US_MRE_ChickenFajita";
				count = 10;
			};
			class _xx_cse_US_MRE_ChickenNoodles {
				weapon = "cse_US_MRE_ChickenNoodles";
				count = 10;
			};
			class _xx_cse_US_MRE_PorkSausageGravy {
				weapon = "cse_US_MRE_PorkSausageGravy";
				count = 10;
			};
			class _xx_cse_US_MRE_MedChicen {
				weapon = "cse_US_MRE_MedChicen";
				count = 10;
			};
			class _xx_cse_US_MRE_BeefRoastVeggies {
				weapon = "cse_US_MRE_BeefRoastVeggies";
				count = 10;
			};
			class _xx_cse_US_MRE_BeefBrisket {
				weapon = "cse_US_MRE_BeefBrisket";
				count = 10;
			};
			class _xx_cse_US_MRE_MeatballMarinara {
				weapon = "cse_US_MRE_MeatballMarinara";
				count = 10;
			};
			class _xx_cse_US_MRE_BeefStew {
				weapon = "cse_US_MRE_BeefStew";
				count = 10;
			};
			class _xx_cse_US_MRE_ChiliMacaroni {
				weapon = "cse_US_MRE_ChiliMacaroni";
				count = 10;
			};
			class _xx_cse_US_MRE_VegetableLasagna {
				weapon = "cse_US_MRE_VegetableLasagna";
				count = 10;
			};
			class _xx_cse_US_MRE_SpicyPennePasta {
				weapon = "cse_US_MRE_SpicyPennePasta";
				count = 10;
			};
			class _xx_cse_US_MRE_CheeseTortellini {
				weapon = "cse_US_MRE_CheeseTortellini";
				count = 10;
			};
			class _xx_cse_US_MRE_Ratatouille {
				weapon = "cse_US_MRE_Ratatouille";
				count = 10;
			};
			class _xx_cse_US_MRE_MexicanStyleChickenStew {
				weapon = "cse_US_MRE_MexicanStyleChickenStew";
				count = 10;
			};
			class _xx_cse_US_MRE_PorkRib {
				weapon = "cse_US_MRE_PorkRib";
				count = 10;
			};
			class _xx_cse_US_MRE_MapleSausage {
				weapon = "cse_US_MRE_MapleSausage";
				count = 10;
			};
			class _xx_cse_US_MRE_BeefRavioli {
				weapon = "cse_US_MRE_BeefRavioli";
				count = 10;
			};
			class _xx_cse_US_MRE_SloppyJoe {
				weapon = "cse_US_MRE_SloppyJoe";
				count = 10;
			};
			class _xx_cse_US_MRE_SpaghettiMeatSauce {
				weapon = "cse_US_MRE_SpaghettiMeatSauce";
				count = 10;
			};
			class _xx_cse_US_MRE_LemonPepperTuna {
				weapon = "cse_US_MRE_LemonPepperTuna";
				count = 10;
			};
			class _xx_cse_US_MRE_AsianBeefStrips {
				weapon = "cse_US_MRE_AsianBeefStrips";
				count = 10;
			};
			class _xx_cse_US_MRE_ChickenPestoPasta {
				weapon = "cse_US_MRE_ChickenPestoPasta";
				count = 10;
			};
			class _xx_cse_US_MRE_SouthwestStyleBeefBlackBeans {
				weapon = "cse_US_MRE_SouthwestStyleBeefBlackBeans";
				count = 10;
			};
			class _xx_cse_mre_c_ration {
				weapon = "cse_mre_c_ration";
				count = 10;
			};
		};
	};	
};