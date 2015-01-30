
class CfgMagazines {

    /* 6.5x39mm Grendel - MX */

    class CA_Magazine;
    class 30Rnd_65x39_caseless_mag: CA_Magazine {
        initSpeed = 724;
    };

    class 100Rnd_65x39_caseless_mag: CA_Magazine {
        initSpeed = 724;
    };


    /* 6.5x39mm Grendel - Katiba */

    class 30Rnd_65x39_caseless_green: 30Rnd_65x39_caseless_mag {
        initSpeed = 724;
    };

    class 200Rnd_65x39_cased_Box: 100Rnd_65x39_caseless_mag {
        initSpeed = 691;
    };


    /* 5.56x45mm NATO */

    class 30Rnd_556x45_Stanag: CA_Magazine {
        initSpeed = 911;
    };


    /* 7.62x51mm NATO */

    class 20Rnd_762x51_Mag: CA_Magazine {
        initSpeed = 792; // 18" M14 EBR barrel
    };

    class 150Rnd_762x51_Box: CA_Magazine {
        ammo = "B_762x51_Ball";
        initSpeed = 853; // Typical MV for M240
    };


    /* Other */

    class 30Rnd_9x21_Mag: CA_Magazine {
        ammo = "B_9x19_Ball";
        initSpeed = 370;
    };

    class 16Rnd_9x21_Mag: 30Rnd_9x21_Mag {
        ammo = "B_9x19_Ball";
        initSpeed = 381;
    };

    class 30Rnd_45ACP_Mag_SMG_01: 30Rnd_9x21_Mag {
        initSpeed = 259;
    };

    class 9Rnd_45ACP_Mag: 30Rnd_45ACP_Mag_SMG_01 {
        initSpeed = 250;
    };
};
