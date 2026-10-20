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
    
    class SAM_System_01_base_F: StaticMGWeapon {
        class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(rim116);
            };
        };

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {QGVAR(rim116)};
                magazines[] = {QGVAR(rim116)};
            };
        };
    };

    class Tank;
    class Tank_F: Tank {
        class Turrets {
            class MainTurret;
        };
    };
    class LT_01_base_F: Tank_F {
        class AnimationSources;
        class Turrets: Turrets {};
    };

    class LT_01_AA_base_F: LT_01_base_F {
        class AnimationSources: AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(FIM92);
            };
        };

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"SmokeLauncher", QGVAR(FIM92), "HMG_127"};
                magazines[] = {
                    "SmokeLauncherMag", 
                    QGVAR(stinger), 
                    QGVAR(stinger), 
                    "100Rnd_127x99_mag_Tracer_Red", 
                    "100Rnd_127x99_mag_Tracer_Red", 
                    "100Rnd_127x99_mag_Tracer_Red", 
                    "100Rnd_127x99_mag_Tracer_Red"
                };
            };
        };
    };

    class APC_Tracked_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {
        class AnimationSources;
    };
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        class AnimationSources: AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(FIM92);
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_35mm", QGVAR(FIM92)};
                magazines[] = {"680Rnd_35mm_AA_shells_Tracer_Red", QGVAR(stinger), QGVAR(stinger)};
            };
        };
    };

    class APC_Tracked_02_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {
        class AnimationSources;
    };
    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        class AnimationSources: AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(FIM92);
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_35mm", QGVAR(FIM92)};
                magazines[] = {"680Rnd_35mm_AA_shells_Tracer_Green", QGVAR(stinger), QGVAR(stinger)};
            };
        };
    };
};
