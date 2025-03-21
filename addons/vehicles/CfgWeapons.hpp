
class CfgWeapons {
    class MGunCore;
    class MGun: MGunCore {};
    class LMG_RCWS: MGun {};
    class LMG_coax: LMG_RCWS {};
    class LMG_coax_ext: LMG_coax {};

    class ACE_LMG_coax_L94A1_mem3: LMG_coax {};
    class ACE_LMG_coax_MAG58_mem3: LMG_coax {};
    class ACE_LMG_coax_ext_MAG58: LMG_coax_ext {};
    class ACE_LMG_coax_ext_MG3: LMG_coax_ext {};
    class ACE_LMG_coax_DenelMG4: LMG_coax {};

    class LMG_Minigun: LMG_RCWS {
        magazines[] += {"2000Rnd_762x51_Belt_T_Green","2000Rnd_762x51_Belt_T_Red","2000Rnd_762x51_Belt_T_Yellow","5000Rnd_762x51_Belt","5000Rnd_762x51_Yellow_Belt"};
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

    class HMG_127_APC: HMG_127 {};
    class ACE_HMG_127_KORD: HMG_127_APC {};

    // Tanks DLC: weapons for Wiesel and Rooikat
    class CannonCore;
    class autocannon_Base_F: CannonCore {};
    class cannon_20mm: autocannon_Base_F {};
    class ACE_cannon_20mm_Rh202: cannon_20mm {};

    class cannon_120mm: CannonCore {};
    class ACE_cannon_120mm_GT12: cannon_120mm {};

};
