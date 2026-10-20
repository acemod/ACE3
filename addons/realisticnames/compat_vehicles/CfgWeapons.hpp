class CfgWeapons {
    class HMG_127_APC;
    class ACE_HMG_127_KORD: HMG_127_APC {
        displayName = "6P49 Kord";
    };

    class cannon_120mm;
    class ACE_cannon_120mm_GT12: cannon_120mm {
        displayName = "GT12";
    };

    class LMG_coax_ext;
    class ACE_LMG_coax_ext_MG3: LMG_coax_ext {
        displayName = "Rheinmetall MG3";
    };
    class ACE_LMG_coax_ext_MAG58: LMG_coax_ext {
        displayName = "MAG 58M";
    };

    class LMG_coax;
    class ACE_LMG_coax_MAG58_mem3: LMG_coax {
        displayName = "MAG 58M";
    };
    class ACE_LMG_coax_L94A1_mem3: LMG_coax {
        displayName = "L94A1";
    };
    class ACE_LMG_coax_DenelMG4: LMG_coax {
        displayName = "Denel MG4";
    };

    class autocannon_Base_F;
    class cannon_20mm: autocannon_Base_F {
        class AP: autocannon_Base_F {};
        class HE: autocannon_Base_F {};
    };
    class ACE_cannon_20mm_Rh202: cannon_20mm {
        displayName = "MK20 Rh 202";
        class AP: AP {
            displayName = "MK20 Rh 202";
        };
        class HE: HE {
            displayName = "MK20 Rh 202";
        };
    };
};
