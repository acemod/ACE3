class Combat_Space_Enhancement {
	class CfgModules {
		class cse_sys_combatdeaf {
			init = "call compile preprocessFile 'cse\cse_sys_combatdeaf\init_sys_combatdeaf.sqf';";
			name = "Combat Deafness";
			class EventHandlers {
				class AllVehicles {
					GetIn = "call cse_fnc_getIn_DEAF; false";
					GetOut = "call cse_fnc_getOut_DEAF; false";
				};
			};
		};
	};
};