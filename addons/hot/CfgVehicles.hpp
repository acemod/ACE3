class CfgVehicles {
    class Tank;
    class Tank_F: Tank {
        class Turrets;
    };
    class LT_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class LT_01_AT_base_F: LT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"SmokeLauncher","HMG_127",QGVAR(generic_launcher)};
                magazines[] = {"SmokeLauncherMag",QGVAR(2_2Rnd),QGVAR(2_2Rnd),QGVAR(2_2Rnd),QGVAR(2MP_2Rnd),"100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
            };
        };
    };
};
