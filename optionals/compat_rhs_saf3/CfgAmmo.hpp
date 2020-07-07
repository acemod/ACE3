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
        ACE_dragModel=1;
        ACE_muzzleVelocities[] = {785, 800, 815};
        ACE_barrelLengths[] = {508.0, 599.948, 660.4};
    };

    // ACE Explosives
    class DirectionalBombBase;
    class rhssaf_mine_mrud_a_ammo: DirectionalBombBase {
        ace_explosives_defuseObjectPosition[] = {-0.034, 0, 0.202};
    };

    class rhssaf_mine_mrud_d_ammo: rhssaf_mine_mrud_a_ammo {
        ace_explosives_defuseObjectPosition[] = {0.0325, 0, 0.18};
    };

    class MineBase;
    class rhssaf_mine_pma3_ammo: MineBase {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.025};
    };

    class rhssaf_mine_tma4_ammo: MineBase {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.045};
    };

    class PipeBombBase;
    class rhssaf_tm100_ammo: PipeBombBase {
        ace_explosives_defuseObjectPosition[] = {-0.055, 0, 0.014};
    };

    class rhssaf_tm200_ammo: rhssaf_tm100_ammo {
        ace_explosives_defuseObjectPosition[] = {-0.055, 0, 0.018};
    };

    class rhssaf_tm500_ammo: rhssaf_tm100_ammo {
        ace_explosives_defuseObjectPosition[] = {-0.056, 0, 0.032};
    };
};
