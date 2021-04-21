class CfgVehicles {
	class LandVehicle;
	class StaticWeapon: LandVehicle {
		class Turrets;
	};
	class StaticMGWeapon: StaticWeapon {
		class Turrets: Turrets {
			class MainTurret;
		};
	};
	
	// RIM-162
	class SAM_System_02_base_F: StaticMGWeapon {
		displayName = "Mk-29";
		class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(RIM162);
            };
        };
		class Turrets: Turrets {
            class MainTurret: MainTurret {
				gunnerName = "Mk-29 Operator";
				weapons[] = {
					QGVAR(RIM162)
				};
                magazines[] = {
					QGVAR(RIM162)
				};
			};
        };
	};
	// Patriot
	class SAM_System_03_base_F: StaticMGWeapon {
		displayName = "MIM-104 Patriot";
		class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(patriot);
            };
		};
		class Turrets: Turrets {
            class MainTurret: MainTurret {
				gunnerName = "MIM-104 Patriot Operator";
				weapons[] = {
					QGVAR(patriot)
				};
                magazines[] = {
					QGVAR(patriot)
				};
			};
        };
	};
	// S-400
	class SAM_System_04_base_F: StaticMGWeapon {
		displayName = "S-400";
		class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(s400);
            };
		};
		class Turrets: Turrets {
            class MainTurret: MainTurret {
				gunnerName = "S-400 Operator";
				weapons[] = {
					QGVAR(s400)
				};
                magazines[] = {
					QGVAR(s400)
				};
			};
        };
	};
};