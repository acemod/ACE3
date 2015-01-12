class Combat_Space_Enhancement {
	class CfgModules {
		class cse_sys_weaponheat {
			init = "call compile preprocessFile 'cse\cse_sys_weaponheat\init_sys_weaponheat.sqf';";
			name = "Weapon Heating";
			class EventHandlers {
				class AllVehicles {
					GetIn = "call cse_fnc_getIn_wh; false";
					GetOut = "call cse_fnc_getOut_wh; false";
				};

				class CAManBase {
					killed = "[_this select 1] call cse_fnc_removeParticleEffectHeat_WH;";
				};
			};
		};
	};
};