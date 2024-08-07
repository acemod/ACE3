class CfgVehicles {
    class Tank;
    class Tank_F: Tank {
        class Turrets {
            class MainTurret;
        };
    };

    class MBT_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                // Overwrite the changes Aegis makes for the .338 coax MG on the Slammer/Merkava
                // The idea is:
                // 1) keep it as realistic as possible
                // 2) the TUSK variant keeps the 7.62mm variant, so the base variant should too
                // 3) easier to overwrite something with skipWhenMissingDependencies than to not overwrite something if another mod is loaded
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
};
