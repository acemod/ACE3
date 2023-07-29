class CfgAmmo {
     // ACE Explosives
    class MineBase;
    class rhs_mine_tm62m_ammo: MineBase {
        EGVAR(explosives,defuseObjectPosition)[] = {-0.005, 0.025, 0.06};
    };

    class rhs_mine_pmn2_ammo: MineBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.012};
    };

    class ATMine_Range_Ammo;
    class rhs_ammo_ptm1: ATMine_Range_Ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0.17, 0.02};
    };

    class APERSMine_Range_Ammo;
    class rhs_ammo_pfm1: APERSMine_Range_Ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0.015, -0.018, 0};
    };

    class PipeBombBase;
    class rhs_ec75_ammo: PipeBombBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0.04, 0.02};
    };

    class rhs_ec200_ammo: rhs_ec75_ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0.05, 0.008};
    };

    class rhs_ec400_ammo: rhs_ec75_ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0.03, 0.02};
    };

    class rhs_mine_msk40p_white_ammo: APERSMine_Range_Ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0.025, 0, 0.4};
    };

    class rhs_mine_sm320_white_ammo: rhs_mine_msk40p_white_ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0.01, 0, 0.25};
    };

    class rhs_mine_ozm72_a_ammo: APERSMine_Range_Ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0, -0.125, 0.11};
    };

    class rhs_mine_ozm72_c_ammo: rhs_mine_ozm72_a_ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0, -0.015, 0.12};
    };
};
