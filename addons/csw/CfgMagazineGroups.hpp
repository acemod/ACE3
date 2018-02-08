class GVAR(groups) {
    // A3 .50 BMG (12.7x99mm)
    class GVAR(100Rnd_127x99_mag) {
        GVAR(family)[] = {"ACE_100Rnd_127x99_Ball_carryable", "ACE_100Rnd_127x99_Red_carryable", "ACE_100Rnd_127x99_Green_carryable", "ACE_100Rnd_127x99_Yellow_carryable"};
        500Rnd_127x99_mag = 1;
        200Rnd_127x99_mag = 1;
        100Rnd_127x99_mag = 1;
        rhs_mag_100rnd_127x99_mag = 1;
        rhs_mag_200rnd_127x99_mag = 1;
        CUP_100Rnd_127x99_M = 1;
		GVAR(HMG_Dummy_200Rnd_mag) = 1;
    };
    class ACE_100Rnd_127x99_Red_carryable {
        GVAR(family)[] = {"ACE_100Rnd_127x99_Ball_carryable", "ACE_100Rnd_127x99_Red_carryable", "ACE_100Rnd_127x99_Green_carryable", "ACE_100Rnd_127x99_Yellow_carryable"};
        500Rnd_127x99_mag_Tracer_Red = 1;
        200Rnd_127x99_mag_Tracer_Red = 1;
        100Rnd_127x99_mag_Tracer_Red = 1;
        rhs_mag_100rnd_127x99_mag_Tracer_Red = 1;
        rhs_mag_200rnd_127x99_mag_Tracer_Red = 1;
        CUP_100Rnd_TE4_Red_Tracer_127x99_M = 1;
    };
    class ACE_100Rnd_127x99_Green_carryable {
        GVAR(family)[] = {"ACE_100Rnd_127x99_Ball_carryable", "ACE_100Rnd_127x99_Red_carryable", "ACE_100Rnd_127x99_Green_carryable", "ACE_100Rnd_127x99_Yellow_carryable"};
        500Rnd_127x99_mag_Tracer_Green = 1;
        200Rnd_127x99_mag_Tracer_Green = 1;
        100Rnd_127x99_mag_Tracer_Green = 1;
        rhs_mag_100rnd_127x99_mag_Tracer_Green = 1;
        CUP_100Rnd_TE4_Green_Tracer_127x99_M = 1;
    };
    class ACE_100Rnd_127x99_Yellow_carryable {
        GVAR(family)[] = {"ACE_100Rnd_127x99_Ball_carryable", "ACE_100Rnd_127x99_Red_carryable", "ACE_100Rnd_127x99_Green_carryable", "ACE_100Rnd_127x99_Yellow_carryable"};
        500Rnd_127x99_mag_Tracer_Yellow = 1;
        200Rnd_127x99_mag_Tracer_Yellow = 1;
        100Rnd_127x99_mag_Tracer_Yellow = 1;
        rhs_mag_100rnd_127x99_mag_Tracer_Yellow = 1;
        CUP_100Rnd_TE4_Yellow_Tracer_127x99_M = 1;
    };
    
    // Soviet HMG (12.7x108mm)
    class ACE_50Rnd_127x108_carryable {
        rhs_mag_127x108mm_50 = 1;
        rhs_mag_127x108mm_100 = 1;
        rhs_mag_127x108mm_150 = 1;
        CUP_150Rnd_127x108_KORD_M = 1;
        CUP_50Rnd_127x108_KORD_M = 1;
        CUP_50Rnd_TE3_LRT5_127x107_DSHKM_M = 1; // not sure why cup uses 107 for the DSHKM?
        CUP_150Rnd_TE3_LRT5_127x107_DSHKM_M = 1;
    };
    
    // A3 20mm GMG
    class ACE_40Rnd_20mm_g_belt_carryable {
        40Rnd_20mm_G_belt = 1;
        200Rnd_20mm_G_belt = 1;
    };


    // A3 82mm mortar shells (Allows the normal mk6 to be reloaded from the mk6 ammo handling mags) 
    class ACE_1Rnd_82mm_Mo_HE {
        8Rnd_82mm_Mo_shells = 1;
    };
    class ACE_1Rnd_82mm_Mo_Smoke {
        8Rnd_82mm_Mo_Smoke_white = 1;
    };
    class ACE_1Rnd_82mm_Mo_Illum {
        8Rnd_82mm_Mo_Flare_white = 1;
    };
    class ACE_1Rnd_82mm_Mo_HE_Guided {
        8Rnd_82mm_Mo_guided = 1;
    };
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided {
        8Rnd_82mm_Mo_LG = 1;
    };
    
    // A3 Titans (Spike) - just use handheld magazines (Does this make sense?)
    class Titan_AT {
        1Rnd_GAT_missiles = 1;
    };
    class Titan_AA {
        1Rnd_GAA_missiles = 1;
    };
};
