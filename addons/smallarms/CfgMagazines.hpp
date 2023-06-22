class CfgMagazines {
    class CA_Magazine;

    // Magazine updates:
    // 1. Update all magazines with tracer mix to use 1 in 5 mix. Full tracer mags should not be changed!
    // 2. Remove tracers at bottom of magazine.

    // 6.5mm //////////////////////////////////////////

    class 30Rnd_65x39_caseless_mag: CA_Magazine { // MX!!
        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class 30Rnd_65x39_caseless_green: 30Rnd_65x39_caseless_mag { // Katiba!!
        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class 100Rnd_65x39_caseless_mag: CA_Magazine { // Katiba!!
        tracersEvery = 5;
        lastRoundsTracer = 3;
    };

    class 200Rnd_65x39_cased_Box: 100Rnd_65x39_caseless_mag {
        tracersEvery = 5;
        lastRoundsTracer = 3;
    };

    // 7.62mm //////////////////////////////////////////

    class 150Rnd_762x51_Box: CA_Magazine {
        tracersEvery = 5;
        lastRoundsTracer = 3;
    };

    // SMG & Pistol ////////////////////////////

    class 30Rnd_9x21_Mag: CA_Magazine {
        lastRoundsTracer = 0;
    };

    class 16Rnd_9x21_Mag: 30Rnd_9x21_Mag {
        displayname = CSTRING(17Rnd_9x19_Name);
        count = 17;
    };

    class 30Rnd_45ACP_Mag_SMG_01: 30Rnd_9x21_Mag {
        displayname = CSTRING(25Rnd_45_Name);
        displaynameshort = ".45";
        picture = "\A3\weapons_f\data\ui\M_30Rnd_9x21_CA.paa";
        count = 25;
        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green: 30Rnd_45ACP_Mag_SMG_01 {
        displayname = CSTRING(25Rnd_45_Tracer_Green_Name);
    };

    class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red: 30Rnd_45ACP_Mag_SMG_01 {
        displayname = CSTRING(25Rnd_45_Tracer_Red_Name);
    };

    class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow: 30Rnd_45ACP_Mag_SMG_01 {
        displayname = CSTRING(25Rnd_45_Tracer_Yellow_Name);
    };

    class 9Rnd_45ACP_Mag: 30Rnd_45ACP_Mag_SMG_01 {
        displayname = CSTRING(8Rnd_45_Name);
        displaynameshort = ".45";
        count = 8;
    };

    class 11Rnd_45ACP_Mag: CA_Magazine {
        displayname = CSTRING(15Rnd_45_Name);
        count = 15;
    };
};
