class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_backblast {
			init = "call compile preprocessFile 'cse\cse_sys_launchers\backblast\init_sys_backblast.sqf';";
			name = "Backblast";
			class EventHandlers {
				class CAManBase {
					FiredNear = "_this call cse_fnc_handleBackBlast_BB;";
				};
			};
		};
	};
};