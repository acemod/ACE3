class cfgMagazines {
    class VehicleMagazine;
    class ACE_PreloadedMissileDummy_Base;
    class rhs_30Rnd_545x39_AK;
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
    class ACE_PreloadedMissileDummy_RPG26: ACE_PreloadedMissileDummy_Base
    {
        ammo = "rhs_rpg26_rocket";
        type = "6 * 256";
        initSpeed = 149;
    };
    class ACE_PreloadedMissileDummy_RSHG2: ACE_PreloadedMissileDummy_RPG26
    {
        ammo = "rhs_rshg2_rocket";
    };
};
