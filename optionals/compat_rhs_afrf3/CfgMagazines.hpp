class cfgMagazines {
    class VehicleMagazine;
    class rhs_30Rnd_545x39_AK;

    class rhs_100Rnd_762x54mmR: rhs_30Rnd_545x39_AK {
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

    class CA_LauncherMagazine;
    class rhs_mag_smaw_SR: CA_LauncherMagazine {
        EGVAR(overpressure,priority) = 99;
        EGVAR(overpressure,angle) = 0;
        EGVAR(overpressure,range) = 0;
        EGVAR(overpressure,damage) = 0;
    };
};
