class CfgAmmo {
    // ACE Explosives
    class PipeBombBase;
    class rhsusf_m112_ammo: PipeBombBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0.055, 0, 0.038};
    };

    class rhsusf_m112x4_ammo: PipeBombBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0.055, -0.025, 0.102};
    };

    class MineBase;
    class rhsusf_mine_m19_ammo: MineBase {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0.02, 0.046};
    };

    class rhsusf_mine_m14_ammo: MineBase {
        EGVAR(explosives,defuseObjectPosition)[] = {-0.02, -0.015, 0.02};
    };

    class APERSMine_Range_Ammo;
    class rhsusf_mine_m49a1_3m_ammo: APERSMine_Range_Ammo {
        EGVAR(explosives,defuseObjectPosition)[] = {0, 0.016, 0.296};
    };
};
