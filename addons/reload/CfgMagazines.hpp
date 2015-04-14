class CfgMagazines {
    class CA_Magazine;
    class 150Rnd_762x51_Box : CA_Magazine {
        ACE_isBelt = 1;
    };

    class 100Rnd_65x39_caseless_mag;
    class 200Rnd_65x39_cased_Box : 100Rnd_65x39_caseless_mag {
        ACE_isBelt = 1;
    };
};
