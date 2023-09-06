class CfgAmmo {
    class PipeBombBase;
    class gm_explosive_petn_charge: PipeBombBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
    };
    class gm_explosive_plnp_charge: PipeBombBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
    };

    class gm_mine_at_base;
    class gm_mine_at_mn111: gm_mine_at_base {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
    };
    class gm_mine_at_dm21: gm_mine_at_base {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
    };
    class gm_mine_at_tm46: gm_mine_at_base {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
    };

    class gm_mine_bounce_base;
    class gm_mine_ap_dm31: gm_mine_bounce_base {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
    };
};
