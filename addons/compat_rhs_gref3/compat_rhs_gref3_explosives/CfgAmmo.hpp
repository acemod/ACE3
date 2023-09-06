class CfgAmmo {
    class APERSMine_Range_Ammo;
    class rhs_mine_a200_bz_ammo: APERSMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.035};
    };

    class rhs_mine_a200_dz35_ammo: rhs_mine_a200_bz_ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.02};
    };

    class rhs_mine_glasmine43_hz_ammo: APERSMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.015};
    };

    class rhs_mine_glasmine43_bz_ammo: rhs_mine_glasmine43_hz_ammo {
        ace_minedetector_detectable = 0;
    };

    class rhs_mine_bounding_trigger_base;
    class rhs_mine_m2a3b_press_ammo: rhs_mine_bounding_trigger_base {
        ace_explosives_defuseObjectPosition[] = {0, 0.046, 0.02};
    };

    class rhs_mine_m2a3b_trip_ammo: rhs_mine_m2a3b_press_ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0.046, 0.055};
    };

    class rhs_mine_M3_pressure_ammo: APERSMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.015};
    };

    class rhs_mine_M3_tripwire_ammo: rhs_mine_M3_pressure_ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.055};
    };

    class ATMine_Range_Ammo;
    class rhs_mine_TM43_ammo: ATMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.072};
    };

    class rhs_mine_M7A2_ammo: APERSMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.067};
    };

    class rhs_mine_Mk2_pressure_ammo: APERSMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.02};
    };

    class rhs_mine_Mk2_tripwire_ammo: rhs_mine_Mk2_pressure_ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.055};
    };

    class APERSBoundingMine_Range_Ammo;
    class rhs_mine_smine35_press_ammo: APERSBoundingMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.03};
    };

    class rhs_mine_smine35_trip_ammo: rhs_mine_bounding_trigger_base {
        ace_explosives_defuseObjectPosition[] = {0, 0, 0.04};
    };

    class rhs_mine_smine44_trip_ammo: rhs_mine_smine35_trip_ammo {
        ace_explosives_defuseObjectPosition[] = {-0.03, 0, 0.015};
    };

    class rhs_mine_smine44_press_ammo: APERSBoundingMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {-0.02, 0, 0.02};
    };

    class APERSTripMine_Wire_Ammo;
    class rhs_mine_stockmine43_2m_ammo: APERSTripMine_Wire_Ammo {
        ace_explosives_defuseObjectPosition[] = {-1, 0, 0.25};
    };

    class rhs_mine_stockmine43_4m_ammo: rhs_mine_stockmine43_2m_ammo {
        ace_explosives_defuseObjectPosition[] = {-2, 0, 0.25};
    };

    class DemoCharge_Remote_Ammo;
    class rhs_charge_M2tet_x2_ammo: DemoCharge_Remote_Ammo {
        ace_explosives_defuseObjectPosition[] = {0.095, 0, 0.055};
    };
};
