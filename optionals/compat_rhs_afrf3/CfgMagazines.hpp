class cfgMagazines {
    class VehicleMagazine;
    class rhs_30Rnd_545x39_7N6_AK;

    class rhs_100Rnd_762x54mmR: rhs_30Rnd_545x39_7N6_AK {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_50: VehicleMagazine {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_150: rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };
    class rhs_mag_127x108mm_1470 : rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };
};
