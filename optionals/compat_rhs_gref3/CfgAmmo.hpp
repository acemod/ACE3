class CfgAmmo {
    class GrenadeHand;
    class rhsgref_ammo_rkg3em: GrenadeHand { // Scripted shaped charge
        ace_frag_force = 0;
    };

    class BulletBase;
    class rhs_ammo_762x25_Ball: BulletBase {
        ACE_caliber = 7.874;
        ACE_bulletLength = 13.856;
        ACE_bulletMass = 5.5728;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.17};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {360, 380, 400};
        ACE_barrelLengths[] = {101.6, 152.4, 228.6};
    };

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

    // ACE Explosives
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
    
    class rhs_ammo_3bk12_penetrator;
    class rhsgref_ammo_rkg3em_penetrator: rhs_ammo_3bk12_penetrator {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class rhs_ammo_rpg75_penetrator: rhs_ammo_3bk12_penetrator {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class rhs_ammo_panzerfaust60_penetrator: rhs_ammo_3bk12_penetrator {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
};
