class CfgAmmo {

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
