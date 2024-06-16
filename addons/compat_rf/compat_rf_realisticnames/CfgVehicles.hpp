class CfgVehicles {
    class Heli_light_03_dynamicLoadout_base_F;
    class B_Heli_light_03_dynamicLoadout_RF: Heli_light_03_dynamicLoadout_base_F {
        displayName = SUBCSTRING(heli_light_03_Name);
    };

    class Heli_light_03_unarmed_base_F;
    class B_Heli_light_03_unarmed_RF: Heli_light_03_unarmed_base_F {
        displayName = SUBCSTRING(heli_light_03_unarmed_Name);
    };

    class I_Heli_light_03_dynamicLoadout_RF;
    class I_E_Heli_light_03_dynamicLoadout_RF: I_Heli_light_03_dynamicLoadout_RF {
        displayName = SUBCSTRING(heli_light_03_Name);
    };

    class I_Heli_light_03_unarmed_RF;
    class I_E_Heli_light_03_unarmed_RF: I_Heli_light_03_unarmed_RF {
        displayName = SUBCSTRING(heli_light_03_unarmed_Name);
    };

    class Heli_EC_01A_base_RF;
    class Heli_EC_01A_military_base_RF: Heli_EC_01A_base_RF {
        displayName = SUBCSTRING(ec_01a_military_Name);
    };

    class Helicopter_Base_H;
    class Heli_EC_01_base_RF: Helicopter_Base_H {
        displayName = SUBCSTRING(ec_01_base_Name);
    };

    class Heli_EC_01_civ_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_01_Name);
    };

    class Heli_EC_01A_civ_base_RF: Heli_EC_01A_base_RF {
        displayName = SUBCSTRING(ec_01a_Name);
    };

    class Heli_EC_02_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_02_Name);
    };

    class Heli_EC_03_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_03_Name);
    };

    class Heli_EC_04_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_04_Name);
    };

    // Typhoon
    class O_Truck_03_fuel_F;
    class C_Truck_03_water_rf: O_Truck_03_fuel_F {
        displayName = SUBCSTRING(truck_03_water_Name);
    };

    // RAM 1500 (Pickup)
    class Offroad_01_unarmed_base_F;
    class Pickup_01_base_rf: Offroad_01_unarmed_base_F {
        displayName = SUBCSTRING(pickup_01_Name);
    };
    class Pickup_fuel_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_fuel_Name);
    };
    class Pickup_service_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_service_Name);
    };
    class Pickup_repair_base_rf: Pickup_service_base_rf {
        displayName = SUBCSTRING(pickup_01_repair_Name);
    };
    class Pickup_comms_base_rf: Pickup_service_base_rf {
        displayName = SUBCSTRING(pickup_01_comms_Name);
    };
    class Pickup_repair_ig_base_rf: Pickup_repair_base_rf {
        displayName = SUBCSTRING(pickup_01_repair_Name);
    };
    class Pickup_01_hmg_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_hmg_Name);
    };
    class Pickup_01_mmg_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_mmg_Name);
    };
    class Pickup_01_mrl_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_mrl_Name);
    };
    class Pickup_01_aat_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_aa_Name);
    };
    class Pickup_covered_base_rf: Pickup_service_base_rf {
        displayName = SUBCSTRING(pickup_01_covered_Name);
    };

    class C_IDAP_Pickup_rf;
    class C_IDAP_Pickup_water_rf: C_IDAP_Pickup_rf {
        displayName = SUBCSTRING(pickup_01_water_Name);
    };

    class StaticMortar;
    class CommandoMortar_base_RF: StaticMortar {
        displayName = SUBCSTRING(commando_Name);
    };

    class StaticMGWeapon;
    class TwinMortar_base_RF: StaticMGWeapon {
        displayName = SUBCSTRING(twinmortar_Name);
    };

    class Helicopter_Base_F;
    class UAV_RC40_Base_RF: Helicopter_Base_F {
        displayName = SUBCSTRING(rc40_base_Name);
    };
    class UAV_RC40_Base_Sensor_RF: UAV_RC40_Base_RF {
        displayName = SUBCSTRING(rc40_Name);
    };
    class UAV_RC40_Base_HE_RF: UAV_RC40_Base_RF {
        displayName = SUBCSTRING(rc40_he_Name);
    };
    class UAV_RC40_Base_SmokeWhite_RF: UAV_RC40_Base_HE_RF {
        displayName = SUBCSTRING(rc40_white_Name);
    };
    class UAV_RC40_Base_SmokeBlue_RF: UAV_RC40_Base_HE_RF {
        displayName = SUBCSTRING(rc40_blue_Name);
    };
    class UAV_RC40_Base_SmokeRed_RF: UAV_RC40_Base_HE_RF {
        displayName = SUBCSTRING(rc40_red_Name);
    };
    class UAV_RC40_Base_SmokeGreen_RF: UAV_RC40_Base_HE_RF {
        displayName = SUBCSTRING(rc40_green_Name);
    };
    class UAV_RC40_Base_SmokeOrange_RF: UAV_RC40_Base_HE_RF {
        displayName = SUBCSTRING(rc40_orange_Name);
    };
};
