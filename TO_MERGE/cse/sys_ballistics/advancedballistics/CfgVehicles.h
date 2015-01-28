class CfgVehicles {
		class Logic;
		class Module_F: Logic {
			class ArgumentsBaseUnits {
			};
		};
		class cse_AB_moduleAdvancedBallistics: Module_F {
		scope = 2; 
		displayName = "Advanced Ballistics [CSE]";
		icon = "\cse\cse_main\data\cse_backblast_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		author = "Ruthberg";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {

			class FORCE_CLIENT_SETTINGS_OVERRIDE {
				displayName = "Force Client Settings override";
				description = "Force Client Settings override";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class WIND_ENABLED {
				displayName = "Wind drift";
				description = "Add wind drift";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class SPIN_DRIFT_ENABLED {
				displayName = "Spin drift";
				description = "add spin drift";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class CORIOLIS_ENABLED {
				displayName = "Horizontal Coriolis drift";
				description = "Horizontal Coriolis drift";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class EOETVOES_ENABLED {
				displayName = "Vertical Coriolis drift";
				description = "Vertical Coriolis drift";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class ADVANCED_AIR_DRAG_ENABLED {
				displayName = "Advanced air drag";
				description = "Enabled the advanced air drag model (only availible with compatible 3rd party ammunition)";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class ATMOSPHERIC_DENSITY_SIMULATION_ENABLED {
				displayName = "Ambient air density ";
				description = "The bullets ability to cut through air becomes affected by the ambient air density";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class TRANSONIC_REGION_ENABLED {
				displayName = "Dispersion beyond supersonic";
				description = "Adds dispersion beyond supersonic flight of rifle bullets";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class MIL_TURRETS_ENABLED {
				displayName = "Zero scope in 1/10 mil";
				description = "Adds the ability to zero your scope in 1/10 Mil steps";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class AMMO_TEMPERATURE_ENABLED {
				displayName = "Ammo temperature";
				description = "Muzzle velocity changes with ammo temperature";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class DISABLED_IN_FULL_AUTO_MODE {
				displayName = "Disabled during full auto";
				description = "Disables the advanced ballistics during full auto fire";
				typeName = "BOOL";
				defaultValue = 0;
			};

			class BULLET_TRACE_ENABLED {
				displayName = "Bullet trace effect";
				description = "Adds a bullet trace effect to high caliber bullets";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class MIRAGE_ENABLED {
				displayName = "Mirage and scope parallax";
				description = "Adds mirage and scope parallax adjustment";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class BARREL_LENGTH_INFLUENCE {
				displayName = "Barrel length dependent";
				description = "Enables barrel length dependent muzzle velocity";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class VEHICLE_GUNNER_ENABLED {
				displayName = "Vehicle Gunners";
				description = "Enables the advanced ballistics for rounds fired as vehicle gunner";
				typeName = "BOOL";
				defaultValue = 1;
			};
			
			class EXTENSIONS_ENABLED {
				displayName = "Extension allowed";
				description = "Allows the use of the DLL extension";
				typeName = "BOOL";
				defaultValue = 1;
			};
			
			class INIT_MESSAGE_ENABLED {
				displayName = "Initialization message";
				description = "Prints a system chat message once the terrain initialization is finished";
				typeName = "BOOL";
				defaultValue = 0;
			};

			class ONLY_ACTIVE_FOR_LOCAL_PLAYER {
				displayName = "Local only";
				description = "Disables the advanced ballistics for bullets coming from other players";
				typeName = "BOOL";
				defaultValue = 0;
			};
			
			class ONLY_ACTIVE_FOR_PLAYER_GROUP {
				displayName = "Group only";
				description = "Disables the advanced ballistics for bullets coming from players in other groups";
				typeName = "BOOL";
				defaultValue = 0;
			};
			
			class DISABLED_BY_DEFAULT {
				displayName = "Disabled by default";
				description = "Allows you to enable the advanced ballistics selectively in the unit initialization";
				typeName = "BOOL";
				defaultValue = 0;
			};
			
			class PRECISION {
				displayName = "Calculation precision";
				description = "Allows to reduces the calculation precision to avoid frame drops (1 - maximum precision, 2 - medium precision, 3 - minimal precision)";
				typeName = "NUMBER";
				defaultValue = 1;
			};
		};
	};
};
