class EGVAR(csw,groups) {
    // --- Gun Turrets -------------------------------------------------------------
    class SPE_50Rnd_762x63 {
        SPE_50Rnd_762x63 = 1;
    };
    class SPE_100Rnd_762x63 {
        SPE_100Rnd_762x63 = 1;
    };

    class SPE_50Rnd_762x63_M1 {
        SPE_50Rnd_762x63_M1 = 1;
    };
    class SPE_100Rnd_762x63_M1 {
        SPE_100Rnd_762x63_M1 = 1;
    };

    class SPE_50Rnd_762x63_M2_AP {
        SPE_50Rnd_762x63_M2_AP = 1;
    };
    class SPE_100Rnd_762x63_M2_AP {
        SPE_100Rnd_762x63_M2_AP = 1;
    };

    class SPE_50Rnd_762x63_Tracer {
        SPE_50Rnd_762x63_Tracer = 1;
    };
    class SPE_100Rnd_762x63_Tracer {
        SPE_100Rnd_762x63_Tracer = 1;
    };

    class SPE_50Rnd_792x57 {
        SPE_50Rnd_792x57 = 1;
    };
    class SPE_100Rnd_792x57 {
        SPE_100Rnd_792x57 = 1;
        SPE_250Rnd_792x57 = 1;
    };

    class SPE_50Rnd_792x57_sS {
        SPE_50Rnd_792x57_sS = 1;
    };
    class SPE_100Rnd_792x57_sS {
        SPE_100Rnd_792x57_sS = 1;
        SPE_250Rnd_792x57_sS = 1;
    };

    class SPE_50Rnd_792x57_SMK {
        SPE_50Rnd_792x57_SMK = 1;
    };
    class SPE_100Rnd_792x57_SMK {
        SPE_100Rnd_792x57_SMK = 1;
        SPE_250Rnd_792x57_SMK = 1;
    };

    class SPE_50Rnd_792x57_Tracer {
        SPE_50Rnd_792x57_Tracer = 1;
    };
    class SPE_100Rnd_792x57_Tracer {
        SPE_100Rnd_792x57_Tracer = 1;
    };

    // Makes it compatible with other mods' .50 BMG
    class EGVAR(csw,100Rnd_127x99_mag) {
        SPE_100Rnd_127x99_M2 = 1;
    };
    class SPE_100Rnd_127x99_M2: EGVAR(csw,100Rnd_127x99_mag) {};

    // --- Mortars -------------------------------------------------------------
    class SPE_1Rnd_81mmHE_M1_M43A1 {
        SPE_8Rnd_81mmHE_M1_M43A1 = 1;
        SPE_1Rnd_81mmHE_M1_M43A1 = 1;
    };
    class SPE_1Rnd_81mmWP_M1_M57 {
        SPE_8Rnd_81mmWP_M1_M57 = 1;
        SPE_1Rnd_81mmWP_M1_M57 = 1;
    };
    class SPE_81mm_M1_M57_SmokeShell {
        SPE_8rnd_81mm_M1_M57_SmokeShell = 1;
        SPE_81mm_M1_M57_SmokeShell = 1;
    };

    class SPE_1Rnd_81mm_FA_Mle_1932_HE {
        SPE_8Rnd_81mm_FA_Mle_1932_HE = 1;
        SPE_1Rnd_81mm_FA_Mle_1932_HE = 1;
    };
    class SPE_81mm_FA_Mle_1932_Smoke {
        SPE_8Rnd_81mm_FA_Mle_1932_Smoke = 1;
        SPE_81mm_FA_Mle_1932_Smoke = 1;
    };
    class SPE_81mm_FA_Mle_1932_Illu {
        SPE_8Rnd_81mm_FA_Mle_1932_Illu = 1;
        SPE_81mm_FA_Mle_1932_Illu = 1;
    };
};
