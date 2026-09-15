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

    // H240 Transport, Gendarmerie/ION Transport
    class Helicopter_Base_H;
    class Heli_EC_01_base_RF: Helicopter_Base_H {
        displayName = SUBCSTRING(ec_01_base_Name);
    };
    // H240C Transport, CIV Transport
    class Heli_EC_01_civ_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_01_civ_base_Name);
    };
    // H235 Transport, CIV Transport Float-less (not used)
    class Heli_EC_01A_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_01a_base_Name);
    };
    // H235C Transport, CIV Transport Float-less
    class Heli_EC_01A_civ_base_RF: Heli_EC_01A_base_RF {
        displayName = SUBCSTRING(ec_01a_civ_base_Name);
    };
    // RAI-350M Cougar (Unarmed), IND/UNA Transport Float-less
    class Heli_EC_01A_military_base_RF: Heli_EC_01A_base_RF {
        displayName = SUBCSTRING(ec_01a_military_base_Name);
    };
    // RAI-360M Cougar, IND/OPF SOCAT Float-less
    class Heli_EC_02_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_02_base_Name);
    };
    // MH-360M Cougar, NATO SOCAT (not used) Float-less
    class B_Heli_EC_02_RF: Heli_EC_02_base_RF {
        displayName = SUBCSTRING(ec_02_nato_Name);
    };
    // MH-245 Cougar, NATO Combat Type
    class Heli_EC_03_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_03_base_Name);
    };
    // H245 SAR, CIV SAR Type
    class Heli_EC_04_base_RF: Heli_EC_01_base_RF {
        displayName = SUBCSTRING(ec_04_base_Name);
    };
    // MH-245 Cougar (Unarmed), NATO Transport Type (Maybe SAR?)
    class Heli_EC_04_military_base_RF: Heli_EC_04_base_RF {
        displayName = SUBCSTRING(ec_04_military_base_Name);
    };

    // HEMTT
    class B_Truck_01_fuel_F;
    class C_Truck_01_water_rf: B_Truck_01_fuel_F {
        displayName = SUBCSTRING(truck_01_water_Name);
    };

    // Typhoon
    class O_Truck_03_transport_F;
    class O_Truck_03_cargo_RF: O_Truck_03_transport_F {
        displayName = SUBCSTRING(truck_03_cargo_Name);
    };

    class O_Truck_03_fuel_F;
    class C_Truck_03_water_rf: O_Truck_03_fuel_F {
        displayName = SUBCSTRING(truck_03_water_Name);
    };

    // RAM 1500 (Pickup)
    class Pickup_service_base_old_rf;
    class Pickup_service_base_rf: Pickup_service_base_old_rf {
        displayName = SUBCSTRING(pickup_01_service_Name);
    };

    class Offroad_01_unarmed_base_F;
    class Pickup_01_base_rf: Offroad_01_unarmed_base_F {
        displayName = SUBCSTRING(pickup_01_Name);
    };
    class Pickup_fuel_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_fuel_Name);
    };
    class Pickup_repair_base_rf: Pickup_service_base_rf {
        displayName = SUBCSTRING(pickup_01_repair_Name);
    };
    class Pickup_comms_base_rf: Pickup_service_base_rf {
        displayName = SUBCSTRING(pickup_01_comms_Name);
    };
    class Pickup_repair_ig_base_rf: Pickup_service_base_old_rf {
        displayName = SUBCSTRING(pickup_01_repair_Name);
    };
    class Pickup_covered_base_rf: Pickup_service_base_rf {
        displayName = SUBCSTRING(pickup_01_covered_Name);
    };

        // Armed Variants
    class Pickup_01_aat_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_aa_Name);
    };
    class Pickup_01_hmg_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_hmg_Name);
    };
    class Pickup_01_minigun_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_minigun_Name);
    };
    class Pickup_01_mmg_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_mmg_Name);
    };
    class Pickup_01_mrl_base_rf: Pickup_01_base_rf {
        displayName = SUBCSTRING(pickup_01_mrl_Name);
    };
    class Pickup_01_rcws_base_rf: Pickup_01_aat_base_rf {
        displayName = SUBCSTRING(pickup_01_rcws_Name);
    };
    class Pickup_01_rocket_base_rf: Pickup_01_aat_base_rf {
        displayName = SUBCSTRING(pickup_01_rocket_Name);
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

    class UAV_01_base_F;
    class UAV_RC40_Base_RF: UAV_01_base_F {
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
