class CfgVehicles {
    class Tank_F;

    class LT_01_base_F: Tank_F {
        class Turrets;
    };

    class LT_01_AA_base_F: LT_01_base_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };

    class Atlas_B_G_LT_01_AA_F: LT_01_AA_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"SmokeLauncher", QEGVAR(missile_manpad,FIM92), "HMG_127"};
                magazines[] = {
                    "SmokeLauncherMag", 
                    QEGVAR(missile_manpad,stinger), 
                    QEGVAR(missile_manpad,stinger), 
                    "100Rnd_127x99_mag_Tracer_Red", 
                    "100Rnd_127x99_mag_Tracer_Red", 
                    "100Rnd_127x99_mag_Tracer_Red", 
                    "100Rnd_127x99_mag_Tracer_Red"
                };
            };
        };
    };
};
