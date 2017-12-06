
class CfgWeapons {
    class MGunCore;
    class MGun: MGunCore {};
    class LMG_RCWS: MGun {};

    class LMG_coax;
    class ACE_LMG_coax_L94A1_mem3: LMG_coax {};
    class ACE_LMG_coax_PKT_mem2: LMG_coax {
        class GunParticles {
            class effect1 {
                positionName = "usti hlavne2";
                directionName = "konec hlavne2";
                effectName = "MachineGunCloud";
            };
        };
    };
    class ACE_LMG_coax_MAG58_mem3: LMG_coax {};
    class ACE_LMG_coax_MAG58_mem2: LMG_coax {
        class GunParticles {
            class effect1 {
                positionName = "usti hlavne2";
                directionName = "konec hlavne2";
                effectName = "MachineGunCloud";
            };
        };
    };

    class LMG_Minigun: LMG_RCWS {
        magazines[] = {"PylonWeapon_2000Rnd_65x39_belt", "1000Rnd_65x39_Belt","1000Rnd_65x39_Belt_Green","1000Rnd_65x39_Belt_Tracer_Green","1000Rnd_65x39_Belt_Tracer_Red","1000Rnd_65x39_Belt_Tracer_Yellow","1000Rnd_65x39_Belt_Yellow","2000Rnd_65x39_Belt","2000Rnd_65x39_Belt_Green","2000Rnd_65x39_Belt_Tracer_Green","2000Rnd_65x39_Belt_Tracer_Green_Splash","2000Rnd_65x39_Belt_Tracer_Red","2000Rnd_65x39_Belt_Tracer_Yellow","2000Rnd_65x39_Belt_Tracer_Yellow_Splash","2000Rnd_65x39_Belt_Yellow","2000Rnd_762x51_Belt_T_Green","2000Rnd_762x51_Belt_T_Red","2000Rnd_762x51_Belt_T_Yellow","200Rnd_65x39_Belt","200Rnd_65x39_Belt_Tracer_Green","200Rnd_65x39_Belt_Tracer_Red","200Rnd_65x39_Belt_Tracer_Yellow","5000Rnd_762x51_Belt","5000Rnd_762x51_Yellow_Belt","500Rnd_65x39_Belt","500Rnd_65x39_Belt_Tracer_Red_Splash","500Rnd_65x39_Belt_Tracer_Green_Splash","500Rnd_65x39_Belt_Tracer_Yellow_Splash"};
    };

    class HMG_127: LMG_RCWS {
        class manual: MGun {};
    };

    class HMG_01: HMG_127 {
        reloadTime = 0.23;

        class manual: manual {
            reloadTime = 0.23;
        };
        class close: manual {};
        class short: close {};
        class medium: close {};
        class far: close {};
    };

    // make static weapons compatible with 100rnd mag variants
    class HMG_static: HMG_01 {
        magazines[] = {"500Rnd_127x99_mag","500Rnd_127x99_mag_Tracer_Red","500Rnd_127x99_mag_Tracer_Green","500Rnd_127x99_mag_Tracer_Yellow","200Rnd_127x99_mag","200Rnd_127x99_mag_Tracer_Red","200Rnd_127x99_mag_Tracer_Green","200Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Green","100Rnd_127x99_mag_Tracer_Yellow"};
    };
};
