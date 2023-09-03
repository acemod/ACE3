class cfgMagazines {
    class VehicleMagazine;
    class rhs_30Rnd_545x39_7N6_AK;

    class rhs_100Rnd_762x54mmR: rhs_30Rnd_545x39_7N6_AK {
        ACE_isBelt = 1;
    };
    class rhs_mag_127x108mm_50: VehicleMagazine {
        ACE_isBelt = 1;
    };
    class rhs_mag_127x108mm_150: rhs_mag_127x108mm_50 {
        ACE_isBelt = 0;
    };
    class rhs_mag_127x108mm_1470: rhs_mag_127x108mm_50 {
        ACE_isBelt = 0;
    };
    class RHS_mag_VOG30_30: VehicleMagazine {
        ACE_isBelt = 1;
    };
};
