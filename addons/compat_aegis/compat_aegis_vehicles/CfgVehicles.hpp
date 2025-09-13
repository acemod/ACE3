class CfgVehicles {
    class All;
    class AllVehicles: All {
        class NewTurret;
    };
    class Land: AllVehicles {};
    class LandVehicle: Land {
        class CommanderOptics: NewTurret {};
    };
    class Tank: LandVehicle {};
    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };
    };

    class APC_Tracked_03_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class APC_Tracked_03_base_v2_F: APC_Tracked_03_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_40mm_CTWS", "ACE_LMG_coax_L94A1_mem3"}; // Aegis upgrades to a 40mm cannon, but we want realistic MG name
            };
        };
    };

    class MBT_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                // Overwrite the changes Aegis makes for the .338 coax MG on the Slammer/Merkava
                // The idea is:
                // 1) keep it as realistic as possible
                // 2) easier to overwrite something with skipWhenMissingDependencies than to not overwrite something if another mod is loaded
                weapons[] = {"cannon_120mm", "ACE_LMG_coax_MAG58_mem3"}; // Base 1.82: "cannon_120mm","LMG_coax"
                magazines[] = {
                    "24Rnd_120mm_APFSDS_shells_Tracer_Red",
                    "12Rnd_120mm_HE_shells_Tracer_Red",
                    "12Rnd_120mm_HEAT_MP_T_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "4Rnd_120mm_LG_cannon_missiles" // Aegis adds laser-guided munitions
                };
            };
        };
    };

    class B_MBT_01_base_F: MBT_01_base_F {};
    class B_MBT_01_cannon_F: B_MBT_01_base_F {};
    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"cannon_120mm", "ACE_LMG_coax_MAG58_mem3"}; // Base 1.82: "cannon_120mm","LMG_coax"
                magazines[] = {
                    "24Rnd_120mm_APFSDS_shells_Tracer_Red",
                    "12Rnd_120mm_HE_shells_Tracer_Red",
                    "12Rnd_120mm_HEAT_MP_T_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "4Rnd_120mm_LG_cannon_missiles" // Aegis adds laser-guided munitions
                };
            };
        };
    };

    class MBT_04_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        // Overwrite the changes Aegis makes for the NSVT commander MG on the T-140 Ankara/T-14
                        // Ideally would be kept as realistically as possible (so 127x108 ammo instead of 127x99),
                        // but since it's been like this for a very long time, bad idea to change (will break missions with magazine loadouts)
                        weapons[] = {"ACE_HMG_127_KORD", "SmokeLauncher"};
                        magazines[] = {"500Rnd_127x99_mag_Tracer_Yellow", "SmokeLauncherMag"};
                    };
                };
            };
        };
    };
};
