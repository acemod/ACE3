
class CfgWeapons {
    class MGunCore;
    class MGun: MGunCore {};
    class LMG_RCWS: MGun {};
    class LMG_coax: LMG_RCWS {};
    class LMG_coax_ext: LMG_coax {};

    class ACE_LMG_coax_L94A1_mem3: LMG_coax {};
    class ACE_LMG_coax_MAG58_mem3: LMG_coax {};
    class ACE_LMG_coax_ext_MAG58: LMG_coax_ext {};

    class LMG_Minigun: LMG_RCWS {
        // Add the following: "2000Rnd_762x51_Belt_T_Green","2000Rnd_762x51_Belt_T_Red","2000Rnd_762x51_Belt_T_Yellow","5000Rnd_762x51_Belt","5000Rnd_762x51_Yellow_Belt"
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
    };
};
