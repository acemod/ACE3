class CfgFunctions {
	class CSE {
		class eventhandlers	{
			file = "cse\cse_f_eh\functions";
			class initialization_f {
				preInit = 1; 
				postInit = 1; 
				recompile = 1;
			};
			class eventHandler_f { recompile = 1; };
            class HandleHeal_EH_F { recompile = 1; };
            class HandleDamage_EH_F { recompile = 1; };
            class customEventHandler_F { recompile = 1; };
            class getCustomResults_F { recompile = 1; };
            class setEventhandler_f { recompile = 1; };
            class removeEventHandler_f { recompile = 1; };
            class addModuleEventHandlers_f { recompile = 1; };
		};
	};
};