class CfgMagazines {
    class CA_Magazine;

    // Magazine updates:
    // 1. Update all magazines with tracer mix to use 1 in 5 mix. Full tracer mags should not be changed!
    // 2. Remove tracers at bottom of magazine.

    // 6.5mm //////////////////////////////////////////

    class 30Rnd_65x39_caseless_mag : CA_Magazine { // MX!!
        displayname = CSTRING(30Rnd_65_Name);
        displaynameshort = "6.5mm";

        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class 30Rnd_65x39_caseless_mag_Tracer : 30Rnd_65x39_caseless_mag { // MX!!
        displayname = CSTRING(30Rnd_Tracer_MX_Name);
        displaynameshort = "6.5mm Tracer";
    };

    class 30Rnd_65x39_caseless_green : 30Rnd_65x39_caseless_mag { // Katiba!!
        displayname = CSTRING(30Rnd_65_Name);
        displaynameshort = "6.5mm";

        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class 30Rnd_65x39_caseless_green_Tracer : 30Rnd_65x39_caseless_green { // Katiba!!
        displayname = CSTRING(30Rnd_Tracer_Katiba_Name);
        displaynameshort = "6.5mm Tracer";
    };

    class 100Rnd_65x39_caseless_mag : CA_Magazine {
        displayname = CSTRING(100Rnd_MX_Name);
        displaynameshort = "6.5mm";

        tracersEvery = 5;
        lastRoundsTracer = 3;
    };

    class 100Rnd_65x39_caseless_mag_Tracer : 100Rnd_65x39_caseless_mag {
        displayname = CSTRING(100Rnd_Tracer_MX_Name);
        displaynameshort = "6.5mm Tracer";
    };

    class 200Rnd_65x39_cased_Box : 100Rnd_65x39_caseless_mag {
        displayname = CSTRING(200Rnd_65_Box_Name);
        displaynameshort = "6.5mm";

        tracersEvery = 5;
        lastRoundsTracer = 3;
    };
    class 200Rnd_65x39_cased_Box_Tracer: 200Rnd_65x39_cased_Box {
        displayname = CSTRING(200Rnd_65_Tracer_Box_Name);
        displaynameshort = "6.5mm Tracer";
    };

    // 7.62mm //////////////////////////////////////////

    class 20Rnd_762x51_Mag: CA_Magazine {
        displayname = CSTRING(20Rnd_762_Name);
        displaynameshort = "7.62mm";
    };

    class 150Rnd_762x51_Box : CA_Magazine {
        displayname = CSTRING(150Rnd_762_Box_Name);

        tracersEvery = 5;
        lastRoundsTracer = 3;
    };

    class 150Rnd_762x51_Box_Tracer : 150Rnd_762x51_Box {
        displayname = CSTRING(150Rnd_762_Box_Tracer_Name);
    };

    // Anti-materiel ///////////////////////////////

    class 7Rnd_408_Mag: CA_Magazine {
        displayname = CSTRING(7Rnd_408_Name);
    };

    class 5Rnd_127x108_Mag: CA_Magazine {
        displayname = CSTRING(5Rnd_127_Name);
    };

    // SMG & Pistol ////////////////////////////

    class 30Rnd_9x21_Mag : CA_Magazine {
        displayname = CSTRING(30Rnd_9x19_Name);
        displaynameshort = "9mm";

        lastRoundsTracer = 0;
    };

    class 16Rnd_9x21_Mag: 30Rnd_9x21_Mag {
        displayname = CSTRING(17Rnd_9x19_Name);
        displaynameshort = "9mm";

        count = 17;
    };

    class 30Rnd_45ACP_Mag_SMG_01 : 30Rnd_9x21_Mag {
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

    class 9Rnd_45ACP_Mag : 30Rnd_45ACP_Mag_SMG_01 {
        displayname = CSTRING(8Rnd_45_Name);
        displaynameshort = ".45";

        count = 8;
    };
};
