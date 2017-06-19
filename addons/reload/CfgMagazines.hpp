class CfgMagazines {
    class CA_Magazine;
    class 150Rnd_762x51_Box: CA_Magazine { // Mag for Negev (LMG_Zafir) - 150Rnd_762x54_Box inherits from this
        ACE_isBelt = 1;
    };

    class 100Rnd_65x39_caseless_mag;
    class 200Rnd_65x39_cased_Box: 100Rnd_65x39_caseless_mag { // Mag for Stoner (LMG_Mk200)
        ACE_isBelt = 1;
    };

    class 150Rnd_93x64_Mag: CA_Magazine { // Mag for HK121 (MMG_01) [DLC Opfor Heavy Gunner]
        ACE_isBelt = 1;
    };
    class 130Rnd_338_Mag: CA_Magazine { // Mag for LWMMG (MMG_02) [DLC Blufor Heavy Gunner]
        ACE_isBelt = 1;
    };
    class 200Rnd_556x45_Box_F: CA_Magazine { // Mag for M249 SAW (LMG_03) [Tanoa]
        ACE_isBelt = 1;
    };
};
