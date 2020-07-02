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
};
