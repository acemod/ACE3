class CfgMagazines {
    // Limit loudness of high-ROF weapons
    class VehicleMagazine;
    class rhs_mag_gau19_air_base: VehicleMagazine {
        EGVAR(hearing,maxLoudness) = 0.25;
    };

    class rhs_mag_m134_pylon_base: VehicleMagazine {
        EGVAR(hearing,maxLoudness) = 0.13;
    };
};
