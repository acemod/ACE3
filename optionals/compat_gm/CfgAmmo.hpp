class CfgAmmo {
    class PipeBombBase;
    class gm_explosive_petn_charge: PipeBombBase {
        EGVAR(explosive,defuseObjectPosition)[] = {0, 0, 0.02};
    };
    class gm_explosive_plnp_charge: PipeBombBase {
        EGVAR(explosive,defuseObjectPosition)[] = {0, 0, 0.02};
    };

    class MineBase;
    class gm_mine_at_mn111: MineBase {
        EGVAR(explosive,defuseObjectPosition)[] = {0, 0, 0.02};
    };
    class gm_mine_at_dm21: MineBase {
        EGVAR(explosive,defuseObjectPosition)[] = {0, 0, 0.02};
    };
    class gm_mine_at_tm46: MineBase {
        EGVAR(explosive,defuseObjectPosition)[] = {0, 0, 0.02};
    };

    class APERSMine_Range_Ammo;
    class gm_mine_ap_dm31: APERSMine_Range_Ammo {
        EGVAR(explosive,defuseObjectPosition)[] = {0, 0, 0.02};
    };
};
