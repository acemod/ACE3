
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

    class Car: LandVehicle {
        GVAR(engineStartDelay) = 1.3;
    };

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
    };

    class APC_Tracked_02_base_F: Tank_F {
        fuelCapacity = 600 * FUEL_FACTOR; // NO FUCKING DATA
    };

    class APC_Tracked_03_base_F: Tank_F {
        fuelCapacity = 660 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_30mm","ACE_LMG_coax_L94A1_mem3"}; // Base 1.82: "autocannon_30mm","LMG_coax"
            };
        };
    };

    class MBT_03_base_F: Tank_F {
        fuelCapacity = 550 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_120mm_long","ACE_LMG_coax_MAG58_mem3"}; // Base 1.82: "cannon_120mm_long","LMG_coax"
            };
        };
    };

    class MBT_01_base_F: Tank_F {
        fuelCapacity = 500 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_120mm", "ACE_LMG_coax_MAG58_mem3"}; // Base 1.82: "cannon_120mm","LMG_coax"
            };
        };
    };

    class B_MBT_01_base_F: MBT_01_base_F {};
    class B_MBT_01_cannon_F: B_MBT_01_base_F {};
    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_120mm", "ACE_LMG_coax_MAG58_mem3"}; // Base 1.82: "cannon_120mm","LMG_coax"
            };
        };
    };
    
    
    
    class MBT_02_base_F: Tank_F {
        fuelCapacity = 600 * FUEL_FACTOR; // again, couldn't find proper data
    };

    
    // Change boat minigun ammo to 7.62

    class Ship_F: Ship {};
    class Boat_F: Ship_F {};
    class Boat_Armed_01_base_F: Boat_F {
        class Turrets: Turrets {
            class FrontTurret;
            class RearTurret: FrontTurret {};
        };
    };
    class Boat_Armed_01_minigun_base_F: Boat_Armed_01_base_F {
        class Turrets: Turrets {
            class RearTurret: RearTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Red"}; // Base 1.82: "2000Rnd_65x39_belt_Tracer_Red"
            };
        };
    };
    class I_Boat_Armed_01_minigun_F: Boat_Armed_01_minigun_base_F {
        class Turrets: Turrets {
            class RearTurret: RearTurret {
                magazines[] = {"2000Rnd_762x51_Belt_T_Yellow"}; // Base 1.82: "2000Rnd_65x39_Belt_Tracer_Yellow"
            };
        };
    };

    class Truck_F: Car_F {};

    class MRAP_01_base_F: Car_F {
        fuelCapacity = 510 * FUEL_FACTOR;
    };

    class MRAP_02_base_F: Car_F {
        fuelCapacity = 500 * FUEL_FACTOR; // couldn't find any data for the punisher
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
            class CommanderTurret: CommanderTurret {
                stabilizedInAxes = 3;
            };
        };
    };

    class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {
        smokeLauncherGrenadeCount = 3;
        smokeLauncherAngle = 80;
        class Turrets: Turrets {
            class CommanderTurret: CommanderTurret {
                stabilizedInAxes = 3;
            };
        };
    };

    class Truck_01_base_F: Truck_F {
        fuelCapacity = 644 * FUEL_FACTOR;
    };

    class Truck_02_base_F: Truck_F {
        fuelCapacity = 1100 * FUEL_FACTOR;
    };

    class Truck_03_base_F: Truck_F {
        fuelCapacity = 900 * FUEL_FACTOR; // NO. FUCKING. DATA.
    };

    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        fuelCapacity = 800 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {};
    class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_40mm_CTWS","ACE_LMG_coax_MAG58_mem3"}; // Base 1.82: "autocannon_40mm_CTWS","LMG_coax"
            };
        };
    };

    class APC_Wheeled_02_base_F: Wheeled_APC_F {
        fuelCapacity = 700 * FUEL_FACTOR;
    };

    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        fuelCapacity = 700 * FUEL_FACTOR;
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class I_APC_Wheeled_03_base_F: APC_Wheeled_03_base_F {};
    class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_30mm_CTWS","ACE_LMG_coax_ext_MAG58", "missiles_titan"}; // Base 1.82: "autocannon_30mm_CTWS","LMG_coax_ext","missiles_titan"
            };
        };
    };

    // Tanks DLC Wiesel 2
    class LT_01_base_F : Tank_F {
        class Turrets : Turrets {
            class MainTurret : MainTurret {};
        };
    };
    class LT_01_cannon_base_F : LT_01_base_F {
        class Turrets : Turrets {
            class MainTurret : MainTurret {
                weapons[] = {
                    "SmokeLauncher",
                    "ACE_LMG_coax_ext_MG3",
                    "ACE_cannon_20mm_Rh202"
                };
            };
        };
    };

    // Tanks DLC Rooikat 120
    class AFV_Wheeled_01_base_F : wheeled_APC_F {
        class Turrets : Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"ACE_cannon_120mm_GT12","ACE_LMG_coax_DenelMG4"};
                magazines[] = {"12Rnd_120mm_APFSDS_shells_Tracer_Red","8Rnd_120mm_HE_shells_Tracer_Red","8Rnd_120mm_HEAT_MP_T_Red","4Rnd_120mm_LG_cannon_missiles","200Rnd_762x51_Belt_T_Red","200Rnd_762x51_Belt_T_Red","200Rnd_762x51_Belt_T_Red","200Rnd_762x51_Belt_T_Red"};
            };
        };
    };

    // Tanks DLC Armata
    class MBT_04_base_F : Tank_F {
        class Turrets : Turrets {
            class MainTurret : MainTurret {
                class Turrets : Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };
    class MBT_04_cannon_base_F : MBT_04_base_F {
        class Turrets : Turrets {
            class MainTurret : MainTurret {
                class Turrets : Turrets {
                    class CommanderOptics: CommanderOptics {
                        weapons[] = {"ACE_HMG_127_KORD","SmokeLauncher"};
                    };
                };
            };
        };
    };
};
