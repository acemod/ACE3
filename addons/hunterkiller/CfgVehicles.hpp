class Optics_Armored;
class Optics_Gunner_APC_02: Optics_Armored {
    class Wide;
    class Medium;
    class Narrow;
}; 

class CfgVehicles {
	class LandVehicle;
	class Tank: LandVehicle {
		class NewTurret;
	};
	class Tank_F: Tank {
		class Turrets {
			class MainTurret: NewTurret {};
		};
    };


    #if __has_include("\CUP\TrackedVehicles\CUP_TrackedVehicles_Bradley\CUP_M2A2.p3d")
    class CUP_M2Bradley_Base: Tank_F {
        class Turrets: Turrets {
			class MainTurret: MainTurret {};
        };
    };
    class CUP_B_M2Bradley_USA_D: CUP_M2Bradley_Base {};
    class CUP_B_M2A3Bradley_USA_D: CUP_B_M2Bradley_USA_D {
        class ace_hk {
            enabled = 1;
            master[] = {0,0};
            puppet[] = {0};
        };
        class Turrets: Turrets {
			class MainTurret: MainTurret {
				class OpticsIn: Optics_Gunner_APC_02 {
                    class Wide: Wide {
						directionStabilized = 1;
                    };
                    class Medium: Medium {
						directionStabilized = 1;
                    };
                };
            };
        };
    };
    #endif
};
