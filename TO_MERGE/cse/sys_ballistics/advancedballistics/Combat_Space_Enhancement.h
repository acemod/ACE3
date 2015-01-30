class Combat_Space_Enhancement {
	class cfgModules {
		class cse_AB_moduleAdvancedBallistics {
			init = "call compile preprocessFile 'cse\cse_sys_ballistics\advancedballistics\init.sqf';";
			name = "Advanced Ballistics";
			class EventHandlers {
				class AllVehicles {
					fired = "call cse_ab_ballistics_fnc_advanced_ballistics; false";
				};
				class CAManBase {
					take = "call cse_ab_ballistics_fnc_synchronize_scope_zero; false";
				};
			};
		};
	};
};
