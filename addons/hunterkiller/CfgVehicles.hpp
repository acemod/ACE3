class Optics_Armored;
class Optics_Gunner_MBT_01: Optics_Armored {
    class Wide;
    class Medium;
    class Narrow;
};
class Optics_Gunner_APC_01: Optics_Armored {
    class Wide;
    class Medium;
    class Narrow;
};
// class Optics_Gunner_APC_02: Optics_Armored {
//     class Wide;
//     class Medium;
//     class Narrow;
// };

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

    class MBT_01_base_F: Tank_F { // Merkel Tank
        GVAR(enabled) = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class OpticsIn: Optics_Gunner_MBT_01 {
                    class Wide: Wide {
                        directionStabilized = 1;
                    };
                    class Medium: Medium {
                        directionStabilized = 1;
                    };
                    class Narrow: Narrow {
                        directionStabilized = 1;
                    };
                };
            };
        };
    };
    class MBT_01_arty_base_F: MBT_01_base_F {
        GVAR(enabled) = 0;
    };
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        GVAR(enabled) = 0;
    };



    class Car;
    class Car_F: Car {};
    class Wheeled_APC_F: Car_F {
        class NewTurret;
        class Turrets {
            class MainTurret: NewTurret {};
        };
    };

    class APC_Wheeled_01_base_F: Wheeled_APC_F { // Badger IFV
        GVAR(enabled) = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class OpticsIn: Optics_Gunner_APC_01 {
                    class Wide: Wide {
                        directionStabilized = 1;
                    };
                    class Medium: Medium {
                        directionStabilized = 1;
                    };
                    class Narrow: Narrow {
                        directionStabilized = 1;
                    };
                };
            };
        };
    };





    // #if __has_include("\CUP\TrackedVehicles\CUP_TrackedVehicles_Bradley\CUP_M2A2.p3d")
    // class CUP_M2Bradley_Base: Tank_F {
    //     class Turrets: Turrets {
    //         class MainTurret: MainTurret {};
    //     };
    // };
    // class CUP_B_M2Bradley_USA_D: CUP_M2Bradley_Base {};
    // class CUP_B_M2A3Bradley_USA_D: CUP_B_M2Bradley_USA_D {
    //     class ace_hunterKiller {
    //         enabled = 1;
    //         master[] = {0,0};
    //         puppet[] = {0};
    //     };
    //     class Turrets: Turrets {
    //         class MainTurret: MainTurret {
    //             class OpticsIn: Optics_Gunner_APC_02 {
    //                 class Wide: Wide {
    //                     directionStabilized = 1;
    //                 };
    //                 class Medium: Medium {
    //                     directionStabilized = 1;
    //                 };
    //             };
    //         };
    //     };
    // };
    // #endif
};
