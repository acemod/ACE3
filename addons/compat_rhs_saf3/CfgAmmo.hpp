class CfgAmmo {
    // ACE Ballistics
    class BulletBase;
    class rhs_ammo_792x57_Ball: BulletBase {
        ACE_caliber = 8.077;
        ACE_bulletLength = 28.651;
        ACE_bulletMass = 12.7008;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.315};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {785, 800, 815};
        ACE_barrelLengths[] = {508.0, 599.948, 660.4};
    };

    class rhs_B_762x39_Ball;
    class rhssaf_ammo_762x39_m82_api: rhs_B_762x39_Ball {
        ACE_Caliber = 7.8994;
        ACE_bulletMass = 7.6074;
        ACE_bulletLength = 27.2796;
        ACE_muzzleVelocities[] = {650, 700, 748};
        ACE_barrelLengths[] = {206.85, 329.62, 412.75};
    };
};
