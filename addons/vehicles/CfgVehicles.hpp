
class CfgVehicles {
    class All {
        class Turrets;
    };

    class AllVehicles: All {
        class NewTurret {
            class Turrets;
        };
    };

    class Land: AllVehicles {};

    class LandVehicle: Land {
        class CommanderOptics;//: NewTurret {};
    };

    class Car: LandVehicle {};

    class Tank: LandVehicle {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics;//: NewTurret {};
                };
            };
        };
    };

    class APC: Tank {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

    class Ship: AllVehicles {
        class Turrets {
            class MainTurret;
        };
    };

    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class Car_F: Car {
        class Turrets {
            class MainTurret: NewTurret {};
        };
    };

    class Wheeled_APC_F: Car_F {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class APC_Tracked_01_base_F: Tank_F {
        fuelCapacity = 500 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets;
            };
        };
    };

    class APC_Tracked_02_base_F: Tank_F {
        fuelCapacity = 600 * FUEL_FACTOR; // NO FUCKING DATA
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {};

    class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_30mm_CTWS","ACE_LMG_coax_MBT_01","missiles_titan"};
                magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Green","60Rnd_30mm_APFSDS_shells_Tracer_Green","2000Rnd_762x51_Belt_Green","2Rnd_GAT_missiles"};
            };
        };
    };

    class APC_Tracked_03_base_F: Tank_F {
        fuelCapacity = 660 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_30mm","ACE_LMG_coax_APC_Tracked_03"};
                magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","1000Rnd_762x51_Belt_Yellow","1000Rnd_762x51_Belt_Yellow"};
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class MBT_03_base_F: Tank_F {
        fuelCapacity = 550 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_120mm_long","ACE_LMG_coax_MBT_01"};
                magazines[] = {"28Rnd_120mm_APFSDS_shells_Tracer_Yellow","14Rnd_120mm_HE_shells_Tracer_Yellow","2000Rnd_762x51_Belt_Yellow","2000Rnd_762x51_Belt_Yellow"};
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class MBT_01_base_F: Tank_F {
        fuelCapacity = 500 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_120mm","ACE_LMG_coax_MBT_01"};
                magazines[] = {"32Rnd_120mm_APFSDS_shells_Tracer_Red","16Rnd_120mm_HE_shells_Tracer_Red","2000Rnd_762x51_Belt_Green","2000Rnd_762x51_Belt_Green"};
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class B_MBT_01_base_F: MBT_01_base_F {};

    class B_MBT_01_cannon_F: B_MBT_01_base_F {};

    class MBT_02_base_F: Tank_F {
        fuelCapacity = 600 * FUEL_FACTOR; // again, couldn't find proper data
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class Ship_F: Ship {};

    class Boat_F: Ship_F {};

    class Boat_Armed_01_base_F: Boat_F {
        class Turrets: Turrets {
            class FrontTurret;
            class RearTurret: FrontTurret {};
        };
    };

    class Boat_Armed_01_minigun_base_F: Boat_Armed_01_base_F {};

    class B_Boat_Armed_01_minigun_F: Boat_Armed_01_minigun_base_F {
        class Turrets: Turrets {
            class FrontTurret: FrontTurret {};
            class RearTurret: RearTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Red"};
            };
        };
    };

    class I_Boat_Armed_01_minigun_F: Boat_Armed_01_minigun_base_F {
        class Turrets: Turrets {
            class FrontTurret: FrontTurret {};
            class RearTurret: RearTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Yellow"};
            };
        };
    };

    class Truck_F: Car_F {
        class Turrets: Turrets {};
    };

    class MRAP_01_base_F: Car_F {
        fuelCapacity = 510 * FUEL_FACTOR;
    };

    class MRAP_02_base_F: Car_F {
        fuelCapacity = 500 * FUEL_FACTOR; // couldn't find any data for the punisher
    };

    class O_MRAP_02_F: MRAP_02_base_F {
        class Turrets;
    };

    class Offroad_01_base_F: Car_F {
        //fuelCapacity = 45;
    };

    class MRAP_03_base_F: Car_F {
        fuelCapacity = 860 * FUEL_FACTOR;
        smokeLauncherGrenadeCount = 3;
        smokeLauncherAngle = 80;
        class Turrets: Turrets {
            class CommanderTurret: MainTurret {
                stabilizedInAxes = 3;
            };
        };
    };

    class MRAP_03_hmg_base_F: MRAP_03_base_F {
        smokeLauncherGrenadeCount = 3;
        smokeLauncherAngle = 80;
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
            class CommanderTurret: CommanderTurret {
                stabilizedInAxes = 3;
            };
        };
    };

    class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {
        smokeLauncherGrenadeCount = 3;
        smokeLauncherAngle = 80;
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
            class CommanderTurret: CommanderTurret {
                stabilizedInAxes = 3;
            };
        };
    };

    class Truck_01_base_F: Truck_F {
        fuelCapacity = 644 * FUEL_FACTOR;
        class Turrets;
    };

    class Truck_02_base_F: Truck_F {
        fuelCapacity = 1100 * FUEL_FACTOR;
        class Turrets;
    };

    class Truck_03_base_F: Truck_F {
        fuelCapacity = 900 * FUEL_FACTOR; // NO. FUCKING. DATA.
        class Turrets;
    };

    class Hatchback_01_base_F: Car_F {
        //fuelCapacity = 45;
        class Turrets;
    };

    class SUV_01_base_F: Car_F {
        //fuelCapacity = 45;
        class Turrets;
    };

    class Van_01_base_F: Truck_F {
        //fuelCapacity = 45;
        class Turrets;
    };

    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        fuelCapacity = 800 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {};

    class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_40mm_CTWS", "ACE_LMG_coax_APC_Wheeled_01"};
                magazines[] = {"60Rnd_40mm_GPR_Tracer_Red_shells","40Rnd_40mm_APFSDS_Tracer_Red_shells","2000Rnd_762x51_Belt_Green"};
            };
        };
    };

    class APC_Wheeled_02_base_F: Wheeled_APC_F {
        fuelCapacity = 700 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets;
            };

            class CommanderOptics: CommanderOptics {};
        };
    };

    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_105mm","ACE_LMG_coax_MBT_01"};
                magazines[] = {"40Rnd_105mm_APFSDS_T_Red","20Rnd_105mm_HEAT_MP_T_Red","2000Rnd_762x51_Belt_Green","2000Rnd_762x51_Belt_Green"};
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        fuelCapacity = 700 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class I_APC_Wheeled_03_base_F: APC_Wheeled_03_base_F {};

    class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_30mm_CTWS","ACE_LMG_coax_MBT_01","missiles_titan"};
                magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","2000Rnd_762x51_Belt_Yellow","2Rnd_GAT_missiles"};
            };
        };
    };

    // static mgs shouldn't use 500 rnd mags.
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret; //: NewTurret {};
        };
    };

    class StaticMGWeapon: StaticWeapon {};

    class HMG_01_base_F: StaticMGWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag","100Rnd_127x99_mag","100Rnd_127x99_mag","100Rnd_127x99_mag","100Rnd_127x99_mag"};
            };
        };
    };

    class B_HMG_01_F: HMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
            };
        };
    };

    class O_HMG_01_F: HMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green"};
            };
        };
    };

    class I_HMG_01_F: HMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow"};
            };
        };
    };

    class HMG_01_high_base_F: HMG_01_base_F {};

    class B_HMG_01_high_F: HMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
            };
        };
    };

    class O_HMG_01_high_F: HMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green"};
            };
        };
    };

    class I_HMG_01_high_F: HMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow"};
            };
        };
    };

    class HMG_01_A_base_F: HMG_01_base_F {};

    class B_HMG_01_A_F: HMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
            };
        };
    };

    class O_HMG_01_A_F: HMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Green"};
            };
        };
    };

    class I_HMG_01_A_F: HMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow"};
            };
        };
    };
};
